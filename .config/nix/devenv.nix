{pkgs, ...}:
{
  # https://devenv.sh/reference/options/
  packages = with pkgs; [ hello ];

  enterShell = ''
    hello
  '';

  languages = {
    c.enable = true;
    clojure.enable = true;
    cplusplus.enable = true;
    go.enable = true;
    haskell.enable = true;
    javascript.enable = true;
    nix.enable = true;
    python.enable = true;
    rust.enable = true;
    zig.enable = true;    
  };
}
