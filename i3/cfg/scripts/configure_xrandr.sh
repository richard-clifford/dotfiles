#! /bin/bash

PRIMARY="LVDS-0"
EXT1="VGA-0"
EXT2="HDMI-0"

if ((xrandr | grep "$EXT1 connected") && (xrandr | grep "$EXT2 connected")); then
	xrandr --output $PRIMARY --off
	xrandr --output $EXT2 --primary --auto --output $EXT1 --auto --right-of $EXT2
	echo "EXT1 & EXT2 enabled"
elif (xrandr | grep "$EXT2 disconnected" && xrandr | grep "$EXT1 connected"); then
	xrandr --output $EXT2 --off
	xrandr --output $EXT1 --primary --auto --output $PRIMARY --auto --left-of $EXT1
	echo "$EXT1 & $PRIMARY enabled"
elif (xrandr | grep "$EXT1 disconnected" && xrandr | grep "$EXT2 connected"); then
	xrandr --output $EXT1 --off
	xrandr --output $EXT2 --primary --auto --output $PRIMARY --auto --left-of $EXT2
	echo "$EXT2 && $PRIMARY enabled"
else
	xrandr --output $EXT1 --off
	xrandr --output $EXT2 --off
	xrandr --output $PRIMARY --primary --auto
	echo "$PRIMARY enabled"
fi

