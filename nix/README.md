# Teach Me Something About ~~Haskell~~ Nix

> Statefull is just stateless indexed by time
> 
> \- nothing

Nix is a counterintuitively simple way of doing package management.
Let's take all the source code, all the programs required to build said source code (dependencies),
and all environment variables and use the hash of that to create an output path.
This is where we execute building.
We add the name of the package and some semantic version just for humans.

This is why you can infect any system you want with nix,
it's so radical it doesn't care what the rest of the system does as long as it can
write in /nix/store for all the programs.
For the specific details I'd refor one to the [excelent paper](https://nixos.org/~eelco/pubs/nixos-jfp-final.pdf).
It's very readable I think.
