{
  inputs = {
    devenv.url = "github:cachix/devenv";
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, devenv, home-manager, ... }: 
    flake-parts.lib.mkFlake {
      inherit inputs;
    } {
      # imports = [
      #   (import ./flake-modules/devenv.nix) self
      # ];
      systems = [ "x86_64-linux" "i686-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        # ' args have system resolved already
        packages.default = config.devShells.default;
        devShells.default = import ./shell.nix { inherit pkgs inputs;};
      };
    };
}
