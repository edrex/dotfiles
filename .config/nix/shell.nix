{ pkgs, inputs}:
inputs.devenv.lib.mkShell
{
  inherit inputs pkgs; # needed for mkShell
  modules = [
    ./devenv.nix
  ];
}
