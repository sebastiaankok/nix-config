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
    nh
    sops
    bat

    # network
    nmap

    # containers
    docker-client
    colima

    # databases
    postgresql

    # citools
    gitleaks
    rclone
    restic
    ssh-to-age

    # k8s
    unstable.k9s
    unstable.kubectl
    unstable.kubecolor
    unstable.krew

    black
    isort
    djlint
    jq
    nixfmt
    prettierd
    shellcheck
    stylua
    taplo
    yamlfmt

  ];
}
