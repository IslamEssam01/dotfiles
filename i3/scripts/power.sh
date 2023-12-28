#! /bin/sh

chosen=$(printf "Power Off\nRestart\nSuspend\nHibernate\nLog Out\nLock" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"Power Off") poweroff ;;
	"Restart") reboot ;;
	"Suspend") systemctl suspend ;;
	"Hibernate") systemctl hibernate ;;
	"Log Out") bspc quit ;;
    # ❯ betterlockscreen --lock -- --time-str '%l:%H:%S %p'
	"Lock") betterlockscreen -l  -- --time-str "%I:%M:%S %p";;
	*) exit 1 ;;
esac
