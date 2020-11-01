#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2020 Chua Hou
#
# This script creates a standalone script for systems on which I do not have
# root access to install rcm on.

set -e

cd $(dirname $0)
RCRC=./rcrc rcup -t none -g > standalone.sh
sed -i "s@$(realpath $(dirname $0))@\$(realpath \$(dirname \$0))@" standalone.sh
sed -i "s@$HOME@\$HOME@" standalone.sh
chmod +x standalone.sh
cd -
