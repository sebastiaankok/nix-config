# nix-config

This is my personal repo for home-manager configuration. Nix allows me to easily switch between Linux, MacOS and WSL2

## Setup

1) Install [nix](https://nixos.org/download)
2) Install standalone [home-manager](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone)
3) Add unstable `nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable`
4) Update `nix-channel --update`
5) Run `git clone https://github.com/sebastiaankok/nix-config.git ~/.config/home-manager`
6) Run `./gen-config.sh` to setup user and homedir configuration
7) Run `home-manager switch`
