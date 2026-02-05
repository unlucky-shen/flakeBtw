{ ... }: 
{
	# wayland tweaks
	environment.sessionVariables = {
		NIXOS_OZONE_WL = "1";
	};

	xdg.portal = {
		enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
	};

	# sddm
	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
	};

	# hyprland
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};
	
	# hyprland essentials
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
	];

}
