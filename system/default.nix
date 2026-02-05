{ config, pkgs, lib, ... }: 
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
		isnormaluser = true;
		description = "tau";
		extragroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};

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
