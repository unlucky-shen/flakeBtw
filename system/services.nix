{ ... }: 
{
	services.flatpak.enable = true;
	services.openssh.enable = true;
	services.udisks2.enable = true;
	services.auto-cpufreq.enable = true;
	services.auto-cpufreq.settings = {
		battery = { 
			governor = "powersave"; 
			energy_performance_preference = "power"; 
			turbo = "never"; 
		};
		charger = { 
			governor = "performance"; 
			energy_performance_preference = "performance"; 
			turbo = "always"; 
		};
	};
}
