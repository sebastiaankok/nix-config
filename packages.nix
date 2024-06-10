{ pkgs, config, ... }:
let
  unstable = import <nixpkgs-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in {

  home.packages = with pkgs; [
    # languages
    python3
    python311Packages.pip
    pipx
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

    # databases
    postgresql

    # k8s
    unstable.k9s
    unstable.kubectl
    unstable.kubecolor
    unstable.krew
    unstable.kubernetes-helm
    unstable.helm-docs
    unstable.cilium-cli
    unstable.teleport
    unstable.stern
    unstable.velero
    unstable.restic

    # Automation
    unstable.vault
    unstable.vault-medusa
    unstable.bws

  ];
}
