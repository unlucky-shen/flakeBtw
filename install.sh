#!/usr/bin/env nix-shell
#!nix-shell -p vim git --run "bash ./install.sh"

git clone https://github.com/unlucky-shen/.FlakeBtw.git
git clone https://github.com/unlucky-shen/hypr.git
git clone https://github.com/unlucky-shen/kitty.git
cd .FlakeBtw
sudo nixos-rebuild switch --flake .#Tau

