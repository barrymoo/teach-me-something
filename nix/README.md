# Teach Me Something About ~~Haskell~~ Nix

> Statefull is just stateless indexed by time
> 
> \- nothing

Nix is a counterintuitively simple way of doing package management.
Let's take all the source code, all the programs required to build said source code (dependencies),
all environment variables and all configuration.
We use this bundle to make a hash which is used for the output path.
This is where we execute building.
We add the name of the package and some semantic version just for humans.
This is why you can ~~infect~~ install it alongside practically any linux distribution you want.
Nix doesn't care what the rest of the system does as long as it can
write in /nix/store for all the programs.
For the specific details I'd refer one to the [excelent paper](https://nixos.org/~eelco/pubs/nixos-jfp-final.pdf).
It's very readable I think.

In this tutorial we will get the basic use case for nix with an eye on
haskell development. 
In other words, if you want to learn nix as a language, go to the nixpills.
If you want to *use* nix for building, tag along.
We will go from first "hello-world" build up to nixops deployments in cloud infrastructure such as AWS.

## Excersizes

### 1. Installing Nix
Follow the instructions on: https://nixos.org/nix/download.html

### 2. How do we decide where to install a nix program?

<input type="text" />

### 3. Why can you infect your system with nix?

<input type="text" />

## First Derivation
A derivation is a description of how a build works.
We use the nix programming langauge to describe these derivations.

