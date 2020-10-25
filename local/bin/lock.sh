#!/usr/bin/env bash
#
# Disables dunst notifications, locks the screen using i3lock, then reenables
# notifications.
#
# Also see https://github.com/dunst-project/dunst/issues/77.

killall -SIGUSR1 dunst
i3lock --nofork "$@" # forward arguments passed to this script to i3lock
killall -SIGUSR2 dunst
