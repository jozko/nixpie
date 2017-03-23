#! /usr/bin/env nix-shell
#! nix-shell -i python -p python pythonPackages.prettytable
# Taken from https://nixos.org/nix/manual/#sec-nix-shell

import prettytable

# Print a simple table.
t = prettytable.PrettyTable(["N", "N^2"])

for n in range(1, 10):
    t.add_row([n, n * n])
    print t
