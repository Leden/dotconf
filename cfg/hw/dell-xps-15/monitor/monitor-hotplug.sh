#!/bin/sh

set -e

SLEEP="5"
EXT_MONITOR_NAME="DP-3"
INT_MONITOR_NAME="eDP-1"

get_mode () {
	xrandr | grep -E '( connected )|(\*)' | awk '{print $1}' | xargs -n2 echo | grep "$1" | awk '{print $2}'
}

get_w () {
	echo "$1" | sed 's/x/ /' | awk '{print $1}'
}

get_h () {
	echo "$1" | sed 's/x/ /' | awk '{print $2}'
}

main () {
	sleep "$SLEEP"

	if xrandr -q | grep -q "$EXT_MONITOR_NAME connected"
	then

		EXT_MONITOR_MODE=$(get_mode "$EXT_MONITOR_NAME")
		INT_MONITOR_MODE=$(get_mode "$INT_MONITOR_NAME")

		EXT_MONITOR_W=$(get_w "$EXT_MONITOR_MODE")
		EXT_MONITOR_H=$(get_h "$EXT_MONITOR_MODE")

		INT_MONITOR_W=$(get_w "$INT_MONITOR_MODE")
		INT_MONITOR_H=$(get_h "$INT_MONITOR_MODE")

		EXT_MONITOR_SCALED_H=$(( EXT_MONITOR_H * 2 ))
		FB_W=$(( EXT_MONITOR_W * 2 ))
		FB_H=$(( EXT_MONITOR_SCALED_H + INT_MONITOR_H ))
		FB="${FB_W}x${FB_H}"

		INT_MONITOR_POS_W=$(( EXT_MONITOR_W - ( INT_MONITOR_W / 2 ) ))
		INT_MONITOR_POS_H="$EXT_MONITOR_SCALED_H"
		INT_MONITOR_POS="${INT_MONITOR_POS_W}x${INT_MONITOR_POS_H}"

        	xrandr --output "$EXT_MONITOR_NAME" --scale 2x2 --mode "$EXT_MONITOR_MODE" --fb "$FB" --pos 0x0
	        xrandr --output "$INT_MONITOR_NAME" --scale 1x1 --pos "$INT_MONITOR_POS"
	else
		xrandr --output "$INT_MONITOR_NAME" --scale 1x1
	fi
}

main
