#!/bin/bash

get_brightness() {
	brightnessctl | grep "Current" | sed 's/.*: \([0-9]\+\) .*/\1/'
}

get_brightness_percents() {
	brightnessctl | grep "Current" | sed 's/.*(\([0-9]\+\)%).*/\1/'
}

get_max_brightness() {
	brightnessctl | grep "Max" | sed 's/.*: \([0-9]\+\)'
}

get_icon() {
    current=$(get_brightness_percents)
	echo "$current"
}

notify_user() {
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "" "Brightness : $(get_icon)%"
}

change_brightness() {
	brightnessctl set "$1" && get_icon && notify_user
}

case "$1" in
	"--get")
		get_brightness
		;;
	"--inc")
		change_brightness "5%+"
		;;
	"--dec")
		change_brightness "5%-"
		;;
	*)
		get_brightness
		;;
esac
