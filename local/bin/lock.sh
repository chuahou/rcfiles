#!/usr/bin/env bash
#
# Disables dunst notifications, locks the screen using i3lock, then reenables
# notifications.
#
# Also see https://github.com/dunst-project/dunst/issues/77.

set -e

# path to work in
PIC_PATH=$HOME/.local/share/lock.sh/

# take screenshot and blur it
# Thanks to
# https://www.reddit.com/r/i3wm/comments/7se3lr/i3_wont_run_a_script_i_wrote/
mkdir -p "$PIC_PATH"
scrot "$PIC_PATH"/screen.png
convert "$PIC_PATH"/screen.png -blur 0x10 "$PIC_PATH"/blur.png

# disable notifications, and
# forward arguments passed to this script to i3lock
killall -SIGUSR1 dunst
i3lock --nofork -i "$PIC_PATH"/blur.png "$@"
killall -SIGUSR2 dunst

# delete pictures
rm "$PIC_PATH"/screen.png || true
rm "$PIC_PATH"/blur.png || true
