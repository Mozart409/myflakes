#!/bin/sh

set -eo

clear

nh home switch . || exit 1

nh os switch . || exit 1

exit 0
