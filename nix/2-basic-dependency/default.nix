{pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation{
  name = "basic-dependency";
  src = ./program.sh;
  args = ["-e" ./builder.sh];
  xonsh = pkgs.xonsh; # program depends on this
}

