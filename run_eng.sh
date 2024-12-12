#!/bin/bash
# Set the keyboard layout to US
setxkbmap us
# Wait for the command to take effect
sleep 1
# Set up keyboard layouts with toggle
setxkbmap -layout us,ru,ua -option grp:lctrl_lshift_toggle

