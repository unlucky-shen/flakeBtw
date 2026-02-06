{ config, pkgs, lib, user, host, ... }: 

{
	imports = [ 
		./hardware-configuration.nix 
		./nvidia.nix
		./packages.nix
		./services.nix
		./wm.nix
	];

	boot.supportedFilesystems = [ "ntfs" "exfat" ];
	
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "Tau";
	networking.networkmanager.enable = true;
	time.timeZone = "Asia/Kuala_Lumpur";

	users.users.tau= {
		isNormalUser = true;
		description = "tau";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};
	
	# programs.git = {
	# 	enable = true;
	# 	settings = {
	# 		user = {
	# 			name  = "Taufiq Haikal";
	# 			email = "taufiqhaikal002@gmail.com";
	# 		};
	# 		init.defaultBranch = "main";
	# 	};
	# };

	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	# fonts
	fonts.packages = with pkgs; [
		nerd-fonts.symbols-only
		nerd-fonts.jetbrains-mono
	];

	networking.firewall.enable = true;

	nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	system.stateVersion = "25.11";
}
