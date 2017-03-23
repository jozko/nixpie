#! /usr/bin/env nix-shell
#! nix-shell -i python -p python pythonPackages.prettytable
# #! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/464c79ea9f929d1237dbc2df878eedad91767a72.tar.gz # uncomment if you'd like to pin
# Taken from https://nixos.org/nix/manual/#sec-nix-shell

import prettytable

# Print a simple table.
t = prettytable.PrettyTable(["N", "N^2"])

for n in range(1, 10):
    t.add_row([n, n * n])
    print t
