{ pkgs, config, ... }:
let
  pkgsUnstable = import <nixpkgs-unstable> {};
in {

  home.packages = [
    pkgsUnstable.argocd
    # k8s
    pkgsUnstable.k9s
    pkgsUnstable.kubectl
    pkgsUnstable.kubecolor
    pkgsUnstable.krew
    pkgsUnstable.kubernetes-helm
    pkgsUnstable.helm-docs
    pkgsUnstable.cilium-cli
    pkgsUnstable.teleport
    pkgsUnstable.stern
    pkgsUnstable.velero
    pkgsUnstable.restic

    # Automation
    pkgsUnstable.vault
    pkgsUnstable.vault-medusa
    pkgsUnstable.bws
  ];
}
