#!/bin/sh

# make $out available
source $stdenv/setup

# print all spells
set -xe

# fixup dependency on interpreter
cat $src | sed "s/bin\/xonsh/nix\\/store\\/"$(echo $xonsh | sed s/\\/nix\\/store\\///)"\\/bin\\/xonsh/" > $out

# make executable
chmod +x $out

