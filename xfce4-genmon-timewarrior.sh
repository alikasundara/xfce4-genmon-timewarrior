#!/usr/bin/env bash

# For now the script works with individual tags only.
# It can display simple, white separators on the left and/or right edges when used with `--left` and/or `--right`.

while [[ "$#" -gt 0 ]]; do
	case $1 in
		--left) left=true ;;
		--right) right=true ;;
		--tag) tag="$2"; shift ;;
		*) echo -e "Unkown param: $1\nUsage: $0 [--left] [--rigth] --tag tag"; exit 1 ;;
	esac
	shift
done

if [ -z "$tag" ]; then
	echo "A tag must be provided"
	exit 1
fi

if timew | grep -q "Tracking ${tag}$"; then
	style="foreground='#AA00AA'"
	txt="${tag}"
	on_click="timew stop ${tag}"
	echo "$txt"
else
	style="foreground='#FFFFFF'"
	txt="no ${tag}"
	on_click="timew start ${tag}"
	echo "$txt"
fi

white_separator="<span foreground='#FFFFFF'>|</span>"
[[ "$right" == "true" ]] && right_separator=$white_separator
[[ "$left" == "true" ]] && left_separator=$white_separator

cat << EOF
<txt>${left_separator}<span ${style}>${txt}</span>${right_separator}</txt>
<tool><span font-family="monospace">$(timew summary "${tag}")</span></tool>
<click>$on_click</click>
<txtclick>$on_click</txtclick>
EOF
