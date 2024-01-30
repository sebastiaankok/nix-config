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
    python3
    python311Packages.pip
    virtualenv
    go

    yq
    jq
    coreutils-full
    nettools
    vivid

    k9s
    kubectl
    kubectl-cnpg
    kubectl-view-allocations
    kubecolor
    krew
    kubernetes-helm
    helm-docs

    vault
    vault-medusa
    cilium-cli
    bws
    teleport
    argocd
    stern
    velero
    restic
  ];

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./configuration.nix
    nixvim.homeManagerModules.nixvim
    ./term
  ];
}
