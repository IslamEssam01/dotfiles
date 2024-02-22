#! /bin/sh

chosen=$(printf "Power Off\nRestart\nSuspend\nHibernate\nLog Out\nLock" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"Power Off") poweroff ;;
	"Restart") reboot ;;
	"Suspend") systemctl suspend ;;
	"Hibernate") systemctl hibernate ;;
	"Log Out") loginctl kill-user $USER ;;
    # ❯ betterlockscreen --lock -- --time-str '%l:%H:%S %p'
	# "Lock") xflock4 ;;
	# "Lock") betterlockscreen --lock -- --time-str '%l:%H:%S %p' ;;
     "Lock") loginctl lock-session;;

	*) exit 1 ;;
esac
