{ config, pkgs, lib, ... }:

{
	imports = [ ./hardware-configuration.nix ];

	boot.kernelParams = [ "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" "nvidia.NVreg_TemporaryFilePath=/var/tmp" ];
	boot.supportedFilesystems = [ "ntfs" "exfat" ];
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	services.xserver.videoDrivers = [ "modesetting" "nvidia" ];

	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};

	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = true;
		powerManagement.finegrained = true;
		open = false;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
		
		prime = {
			offload = {
				enable = true;
				enableOffloadCmd = true;
			};
			intelBusId = "PCI:0:2:0";
			nvidiaBusId = "PCI:1:0:0";
		};
	};

	environment.sessionVariables = {
		NIXOS_OZONE_WL = "1";
	};

	xdg.portal = {
		enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
	};

	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
	};

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};
	
	programs.hyprlock.enable = true;
	programs.nm-applet.enable = true;
	
	services.udisks2.enable = true;

	environment.systemPackages = with pkgs; [
		hyprpolkitagent 
		dunst 
		waybar 
		libappindicator 
		libayatana-appindicator 
		wofi 
		swww 
		hyprsunset 
		hypridle 
		hyprshot 
		hyprlock 
		kdePackages.dolphin 
		udiskie 
		ntfs3g 
		exfat

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
		auto-cpufreq 
		killall 
		networkmanagerapplet
		kitty
	];

	networking.hostName = "Tau";
	networking.networkmanager.enable = true;
	time.timeZone = "Asia/Kuala_Lumpur";

	users.users.tau= {
		isNormalUser = true;
		description = "tau";
		extraGroups = [ "networkmanager" "wheel" ];
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

	networking.firewall.enable = true;

	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	system.stateVersion = "25.11";
}
