{pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation{
  name = "hello-world";
  src = ./program.sh;
  args = ["-e" ./builder.sh];
}

