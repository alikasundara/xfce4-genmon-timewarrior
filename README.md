# xfce4-genmon-timewarrior

Simple Timewarrior interface running on top of Xfce4's Genmon.
Tracks and manages a single `Timewarrior` tag.

## Installation

1. Clone this repo or download the raw shell script `xfce4-genmon-timewarrior.sh` (this is all you need). Move the script somewhere sensible (e.g. `/usr/local/bin/`);
2. Ensure that [Timewarrior](https://timewarrior.net/) is installed.
3. Create a new `timew` database by starting `timew` at least once. This script assumes the DB is in the standard location (`$HOME/.timewarrior`), adjust as you see fit;
4. Ensure that [xfce4-genmon-plugin](https://gitlab.xfce.org/panel-plugins/xfce4-genmon-plugin) is installed;
5. Add an instance of the `genmon` to your panel;
6. Set the `Command` to `/usr/local/bin/xfce4-genmon-timewarrior.sh TAG`, where `TAG` is the timewarrior tag that you want to track. Adjust the path if you copied the script elsewhere;
7. Optionally, pass `--left` and/or `--right` to surround the text with white separators (`|`).
7. The plugin refreshes every `Period` seconds. Set that to whatever you want.

## Usage

Click on the text to toggle the tracking. Hover mouse over the text to see today's tag summary.

