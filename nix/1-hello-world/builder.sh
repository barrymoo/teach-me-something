#!/bin/sh

# make $out available
source $stdenv/setup

# print all spells
set -xe

# fixup dependency on interpreter
cp $src $out

# make executable
chmod +x $out

