#!/bin/bash
# Power menu for waybar (custom/power), shown with wofi.

lock="󰌾  Lock"
logout="󰍃  Logout"
suspend="󰒲  Suspend"
reboot="󰜉  Reboot"
shutdown="󰐥  Shutdown"

choice=$(printf '%s\n' "$lock" "$logout" "$suspend" "$reboot" "$shutdown" |
    wofi --dmenu --prompt "Power" --width 260 --height 260 --cache-file /dev/null)

case $choice in
    "$lock")     loginctl lock-session ;;
    "$logout")   hyprctl dispatch 'hl.dsp.exit()' ;;
    "$suspend")  systemctl suspend ;;
    "$reboot")   systemctl reboot ;;
    "$shutdown") systemctl poweroff ;;
esac
