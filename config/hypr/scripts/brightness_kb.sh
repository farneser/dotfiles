#!/usr/bin/env bash


# Get keyboard brightness
get_kbd_backlight() {
	echo $(brightnessctl -d '*::kbd_backlight' -m | cut -d, -f4)
}

# Get icons
get_icon() {
	current=$(get_kbd_backlight | sed 's/%//')
	icon=""
}
# Notify
notify_user() {
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$icon" "Keyboard Brightness : $current%"
}

# Change brightness
change_kbd_backlight() {
	brightnessctl -d *::kbd_backlight set "$1" && get_icon && notify_user
}

# Execute accordingly
case "$1" in
	"--get")
		get_kbd_backlight
		;;
	"--inc")
		change_kbd_backlight "+30%"
		;;
	"--dec")
		change_kbd_backlight "30%-"
		;;
	*)
		get_kbd_backlight
		;;
esac
