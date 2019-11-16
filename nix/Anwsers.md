# Teach Me Something About ~~Haskell~~ Nix
### 1. Installing Nix
42 obviously

### 2. How does nix decide where to install a program?
makes a hash of the buildinputs and dumps it into nix/store.
Bonus points if you name all:

+ Sources of the components
+ Script that performed the build
+ Any arguments or env variables passed to the script
+ All build time deps.

It's in the [paper](https://grosskurth.ca/bib/2006/dolstra-thesis.pdf)
on page 20.

### 3. Why can you install nix alongside your favorite distribution?
Because nix will do everything in the nix store,
and won't interfere at all with more traditional directories.
It's somewhat akin to having an autistic distribution,
remaining in it's own little immutable world.

# Hello build
### Rename the build to something witty or snarky
I came up with 'buildozer'. I'm not very creative.
### Make the print a better message than hello-world
echo "echo \"you again?\"" >> ./1-hello-world/program.sh
### Put the source code into a subdirectory, modify the builder to handle that
It's just to show you can use directories as well,
should be trivial.

### Pin this build
Something like this:
```nix
{pkgs ? (builtins.fetchGit {
    # Descriptive name to make the store path easier to identify
    name = "nixos-pin-19.10.2019";
    url = https://github.com/nixos/nixpkgs/;
    rev = "f203d50d09052792866f926e7c2d3b3bf76d3388";
    }) }:
pkgs.stdenv.mkDerivation{
  name = "hellow-world";
  src = ./program.sh;
  args = ["-e" ./builder.sh];
}
```
I like to put it into a seperate file aswell.

#### After pinning, try overriding this pkgs again with the default one
You can put any expression as arg:
```bash
   nix-build --arg pkgs "(import ../../raster/reflex/packages.nix)" 1-hello-world       
```
### Show the derivation of this build
```bash
nix show-derivation /nix/store/whatevesrsha-name
```
