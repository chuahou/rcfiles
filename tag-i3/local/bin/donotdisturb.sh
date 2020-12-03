#!/usr/bin/env bash
#
# Toggles whether dunst notifications are enabled.
#
# Also see https://github.com/dunst-project/dunst/issues/77.

set -e

# path to work in
DNDPATH=$HOME/.local/share/dndenable

get_status () {
	if [ -f "$DNDPATH" ]; then
		echo "do not disturb"
	else
		echo "notif on"
	fi
}

toggle () {
	if [ -f "$DNDPATH" ]; then
		killall -SIGUSR2 dunst && rm $DNDPATH
	else
		killall -SIGUSR1 dunst && touch $DNDPATH
	fi
}

if [ "$#" -lt 1 ]; then
	get_status
else
	case "$1" in
		toggle) toggle     ;;
		*)      get_status ;;
	esac
fi
