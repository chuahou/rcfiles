#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2020 Chua Hou

notify-send -a "Updates" \
	"$(/usr/lib/update-notifier/apt-check --human-readable)"
