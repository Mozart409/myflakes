#!/bin/sh

echo "Deleting generations..."

nix-env --list-generations
# sudo nix-collect-garbage -d
# sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +5
exit 0
