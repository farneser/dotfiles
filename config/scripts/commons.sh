menu() {
    rofi -show drun -show-icons
}

windows() {
    python3 ~/.config/scripts/windows.py
}

fileManager() {
    nemo
}

terminal() {
    kitty
}


toggleWaybar() {
    killall waybar || waybar
}

# Execute accordingly
case "$1" in
	"--menu")
		menu
		;;
    "--windows")
		windows
        ;;
	"--toggle-waybar")
		toggleWaybar
        ;;
	"--terminal")
		terminal
        ;;
	"--files")
        fileManager
		;;
	*)
		menu
		;;
esac
