{ ... }: 
{

	programs.steam.enable = true;
	programs.steam.gamescopeSession.enable = true;
	programs.gamemode.enable = true;

	environment.systemPackages = with pkgs; [
		# core utils
		wget 
		curl 
		xclip 
		wl-clipboard 
		unzip 
		p7zip 
		libarchive 
		flatpak 
		htop 
		openssh 
		fzf 
		ripgrep 
		fd 
		eza 
		bat 
		auto-cpufreq 
		killall 
		networkmanagerapplet

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
		fastfetch
		
		# misc
		bibata-cursors
	];
	
}
