#!/usr/bin/env nix-shell
#!nix-shell -p vim git --run "bash ./install.sh"

# Clone necessary repos
git clone https://github.com/unlucky-shen/.FlakeBtw.git
git clone https://github.com/unlucky-shen/hypr.git
git clone https://github.com/unlucky-shen/kitty.git

# Copy generated hardware config to flake directory
sudo cp /etc/nixos/hardware-configuration.nix /home/tau/.FlakeBtw/system/hardware-configuration.nix

# Navigate into flake
cd .FlakeBtw/

# Track changes
git add .

# Apply config
sudo nixos-rebuild switch --flake .#Tau
