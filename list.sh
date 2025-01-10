#!/bin/bash

echo "Listing generations"

nix-env --list-generations

sudo nix-env -p /nix/var/nix/profiles/system --delete-generations -5

exit 0
