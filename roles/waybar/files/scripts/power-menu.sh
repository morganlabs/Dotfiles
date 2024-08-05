#!/bin/sh

options+="󰗮 Hibernate"
options+="\n󰒲 Sleep"
options+="\n󱥠 Lock"
options+="\n󰌾 Log Out"
options+="\n󰜉 Reboot"
options+="\n󰐥 Shutdown"

chosen="$(echo -e "$options" | rofi -dmenu -theme-str 'configuration { show-icons: false; } inputbar { enabled: false; }')"

case "$chosen" in
	"󰗮 Hibernate")
		systemctl hibernate
		;;
	"󰒲 Sleep")
		systemctl suspend
		;;
	"󱥠 Lock")
		hyprlock
		;;
	"󰌾 Log Out")
		hyprctl dispatch exit
		;;
	"󰜉 Reboot")
		reboot
		;;
	"󰐥 Shutdown")
		shutdown now
		;;
esac
