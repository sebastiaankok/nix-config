{ config, pkgs, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-23.11";
  });
in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  nixpkgs.config.allowUnfree = true;
  home.username = "sebastiaankok";
  home.homeDirectory = "/Users/sebastiaankok";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    python3
    python311Packages.pip
    virtualenv
    go

    yq
    jq
    nettools

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


  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    nixvim.homeManagerModules.nixvim
    ./term
  ];
}
