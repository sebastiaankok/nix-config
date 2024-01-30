{ config, pkgs, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-23.11";
  });
in

{
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # languages
    python3
    python311Packages.pip
    virtualenv
    go

    # system tools
    yq
    jq
    coreutils-full
    tree
    nettools
    vivid

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

  imports = [
    ./local.nix
    nixvim.homeManagerModules.nixvim
    ./term
  ];
}
