{ config, pkgs, lib, ... }:

{
	programs.steam.enable = true;
	programs.steam.gamescopeSession.enable = true;
	programs.gamemode.enable = true;

	environment.systemPackages = with pkgs; [
		# core utils
		wget 
		curl 
		wl-clipboard 
		unzip 
		p7zip 
		libarchive 
		flatpak 
		htop 
		fzf 
		ripgrep 
		fd 
		eza 
		auto-cpufreq 
		killall 

		# dev tools
		git 
		gcc 
		gnumake 
		cmake 
		gfortran 
		python3 
		uv 
		rustup 
		typst 
		starship

		# apps
		kitty
		zathura 
		libreoffice 
		protonup-qt
		
		# misc
		bibata-cursors
	];
}
