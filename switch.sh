#!/bin/sh

set -eo

clear

git add . || exit 1

nh home switch . || exit 1

nh os switch . || exit 1

sudo systemctl reset-failed

exit 0
