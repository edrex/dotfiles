My dotfiles:

 - managed in a Git repo with [yadm](https://yadm.io/)
 - making extensive use of [direnv](https://direnv.net/)


## nix flake

This repo is also a nix flake, using [flake-parts](https://flake.parts/):

```
nix run github:edrex/dotfiles?dir=nix
```

Once [Source tree abstraction by edolstra · Pull Request #6530 · NixOS/nix](https://github.com/NixOS/nix/pull/6530) is merged, I'll move the flake.nix to the root dir (currently it tries to copy my homedir to the store, no bueno).
