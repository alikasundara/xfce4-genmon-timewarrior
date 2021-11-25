#!/usr/bin/env bash

# for now the script works with individual tags only
tag=$1

if [ -z "$tag" ]; then
	echo "A tag must be provided"
	exit 1
fi

# Using the start / stop icons from the current Xfce4 theme
theme=$(xfconf-query -lvc xsettings -p /Net/ThemeName | awk '{ print $2}')
icons_dir="/usr/share/icons/${theme}/24x24/actions"
start_icon="${icons_dir}/media-record-symbolic.symbolic.png"
stop_icon="${icons_dir}/media-playback-stop-symbolic.symbolic.png"

if timew | grep -q "Tracking ${tag}$"; then
	style="foreground='#A31515'"
	txt="${tag} (active)"
	icon=$stop_icon
	on_click="timew stop ${tag}"
	echo "$txt"
else
	style="foreground='#000000'"
	txt="${tag} (-)"
	icon=$start_icon
	on_click="timew start ${tag}"
	echo "$txt"
fi

cat << EOF
<img>$icon</img>
<txt><span ${style}>${txt}</span></txt>

<tool><span font-family="monospace">$(timew summary "${tag}")</span></tool>
<click>$on_click</click>
<txtclick>$on_click</txtclick>
EOF
