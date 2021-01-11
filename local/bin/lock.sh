#!/usr/bin/env bash
#
# Disables dunst notifications, locks the screen using i3lock, then reenables
# notifications.
#
# Also see https://github.com/dunst-project/dunst/issues/77.
donotdisturb.sh on
i3lock --nofork -i "$PIC_PATH"/blur.png "$@"
donotdisturb.sh off
