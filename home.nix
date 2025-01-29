{ config, pkgs, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-24.11";
  });
in

{
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "sebastiaan@linux.com";
    userName = "Sebastiaan Kok";
    extraConfig = {
      color = { ui = true; };
      core = { pager = "diff-so-fancy | less --tabs=4 -RF"; };
      interactive = {diffFilter = "diff-so-fancy --patch"; };
    };
  };

  imports = [
    nixvim.homeManagerModules.nixvim
    ./term
    ./packages.nix
    ./local.nix
  ];
}
