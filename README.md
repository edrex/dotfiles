My dotfiles:

 - managed in a Git repo with [yadm](https://yadm.io/)
 - making extensive use of [direnv](https://direnv.net/)

This repo is also a nix flake, using [flake-parts](https://flake.parts/):

```
nix run github:edrex/dotfiles?dir=nix
```
