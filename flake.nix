{
	description = "FlakeBtw";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

		nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	};

	outputs = { self, nixpkgs, nixvim, ... }: 
	let
		lib = nixpkgs.lib;
	in {
		nixosConfigurations = {
			Tau = lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit nixvim; };
				modules = [ ./configuration.nix ];
			};
		};
	};
}
