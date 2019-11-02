# Teach Me Something About ~~Haskell~~ Nix

> Stateful is just stateless indexed by time
> 
> \- nothing

Nix is a counter intuitively simple way of doing package management.
Let's take all the source code, all the programs required to build said source code (dependencies),
all environment variables and all configuration.
We use this bundle to make a hash which is used for the output path.
This is where we execute building.
We add the name of the package and some semantic version just for humans.
This is why you can ~~infect~~ install it alongside practically any Linux distribution you want.
Nix doesn't care what the rest of the system does as long as it can
write in /nix/store for all the programs.
For the specific details I'd refer one to the [excellent paper](https://grosskurth.ca/bib/2006/dolstra-thesis.pdf).
It's very readable I think.

In this tutorial we will get the basic use case for nix with an eye on
Haskell development. 
In other words, if you want to learn nix as a language, go to the [nix pills](https://nixos.org/nixos/nix-pills/).
If you want to *use* nix for building, tag along.
We will go from first "hello-world"
to full Haskell builds.

## Exercises

### Installing Nix
Follow the instructions on: https://nixos.org/nix/download.html

### How does nix decide where to install a program?

<input type="text" />

### Why can you install nix alongside your favorite distribution?

<input type="text" />

# Hello build
By convention we call the default target for either nix shell or a nix
build `default.nix`.
It actually becomes the default target for the directory,
try building the directory in this folder:

```shell
nix-build ./1-hello-world
```

Now you can execute the resulting build.
The build consists of 3 parts:

1. Source code
2. The nix expression
3. The builder script

If we cat `default.nix` we get something like this:
```nix
{pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation{
  name = "hellow-world";
  src = ./program.sh;
  args = ["-e" ./builder.sh];
}
```

The language itself is pure, untyped and lazy.
That first line defines a function with an argument pkgs.
The question mark import indicates that this pkgs argument is filled
by the running system nixpkgs.
That's a pretty bad default considering it won't be reproducible anymore.
This is why we [pin repositories](https://jappieklooster.nl/pinning-nixops-builds.html).

Nix provides us ways of automatically generating
builders for most languages, such as Haskell, python and c.
More on that later.
That `builder.sh` maybe superfluous code.
However this just shows you can completely bypass the defaults
if you want to.
While still retaining the properties of nix.

## Exercises

### Rename the build to something witty or snarky
### Make the print a better message than hello-world
Note what happens to the output path
### Put the source code into a sub-directory, modify the builder to handle that
### Pin this build
Always pin.
#### After pinning, try overriding this pkgs again with the default one
Checkout the man
### Show the derivation of this build

# Dependencies

This entire system revolves around managing dependencies so let's do that!
In here I made a second derivation to build:

```shell
nix-build ./2-basic-dependency
```

We specify a dependency with help of [nixpkgs](https://github.com/NixOS/nixpkgs).


## Exercises

### Swap out that weird xonsh with propper python
#### find python in nixpkgs
https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/python.section.md
The with keyword pulls in a dictionary into scope as variables.
#### Rename xonsh to python
#### modify buildscript
#### Modify source to not do shell inline

### Try add a python dependency as well such as requests or beautifullsoup


# Haskell
For normal, non-ghcjs haskell projects
I'd recommend my
[template project](https://github.com/jappeace/haskell-template-project)
Whenever I start a new project I just clone that 
repo and push it into a different gihtub repo.
Effectively forking it.

cabal2nix will generate a `default.nix` file which
will pull in all haskell based dependencies.
We can then override that default with additional
dependencies like [this](https://github.com/jappeace/cut-the-crap/blob/master/shell.nix#L4)

## Exercises

### Clone template repo as a playground
### Add lens as a dependency
### Now add lens from github as a dependency
We can snatch any cabal project from github
and use that instead of whatever is on hackage.
### Disable tests of lens
Sometimes builds fail on this,
being able to skip this dumb step can get you one step closer out of hell.
### Replace the reflection library where lens depends upon with the latest from github
We can replace dependencies from dependencies!
### Make a proper release derivation that copies over the resulting binary
### Add haskell IDE engine as a dependency for your shell
Every project should track it's own development dependencies as well,
so we have developers all working with the same tools.
Nobody does this.
