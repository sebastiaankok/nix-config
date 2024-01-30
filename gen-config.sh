#!/bin/bash

cat << EOF > ./configuration.nix
{
  home.username = "$USER";
  home.homeDirectory = "$HOME";
}
EOF
