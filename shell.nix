{ pkgs ? import <nixpkgs> {}}:

  let 
    nixpkgsLocal = ./src/github.com/NixOS/nixpkgs;
  in pkgs.mkShell {
  packages = with pkgs; [ 
    # basics
    unzip

    # essential dev tools
    helix 

    # git 
    gitFull # incl git gui, gitk
    gitu # magit for term!
    
    fd fzf zoxide
    sd # sed alt https://github.com/chmln/sd
    choose # cut alt https://github.com/theryangeary/choose
    
    eza # better ls https://github.com/eza-community/eza
    
    # workflow creation
    just gum tydra (pkgs.callPackage (nixpkgsLocal + "/pkgs/by-name/hy/hydra-menu/package.nix") {})

    # direnv
    direnv nix-direnv
    
    # ops
    htop btop glances

    # file managers
    ranger nnn lf 
    
    
    # nix
    nixd # LS with comprehensive goto definition etc
    nh # QoL wrapper for nix build, nixos-rebuild, home-manager, etc. See ./nix/Justfile for usage example
    
    # docs / org
    ((emacsPackagesFor emacs29-pgtk).emacsWithPackages
        (epkgs: [ epkgs.vterm ]))
    (ripgrep.override {withPCRE2 = true;})

    # TODO: how to "activate" XDG dirs into main home session?
    wezterm

    # docs - maybe obsidian should be in wiki tho
    obsidian 
    markdown-oxide
    pandoc

    # wayland stuff
    wlrctl # interact with wayland toplevels etc via script
  ];
   # ++ (import ./packages {}) ;
}
