#!/bin/bash

cat << EOF > ./local.nix
{
  home.username = "$USER";
  home.homeDirectory = "$HOME";
}
EOF
