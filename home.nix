{ config, pkgs, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    #ref = "nixos-23.11";
  });
in

{
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # languages
    python3
    python311Packages.pip
    pre-commit
    virtualenv
    go

    # system tools
    yq
    jq
    coreutils-full
    tree
    nettools
    vivid
    diff-so-fancy
    ripgrep
    eza
    lazygit
    btop

    # kubernetes
    k9s
    kubectl
    kubecolor
    krew
    kubernetes-helm
    helm-docs
    cilium-cli
    teleport
    argocd
    stern
    velero
    restic

    # automation
    vault
    vault-medusa
    bws
  ];

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    extraConfig = {
      color = { ui = true; };
      core = { pager = "diff-so-fancy | less --tabs=4 -RF"; };
      interactive = {diffFilter = "diff-so-fancy --patch"; };
    };
  };

  imports = [
    ./local.nix
    nixvim.homeManagerModules.nixvim
    ./term
  ];
}
