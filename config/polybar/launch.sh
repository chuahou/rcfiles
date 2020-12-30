#!/usr/bin/env bash

killall -q polybar
polybar main & disown

sleep 1
for ipc in dnd_ipc nordvpn_ipc sound_ipc cpufreq_ipc; do
	polybar-msg hook $ipc 1; sleep 1
done
