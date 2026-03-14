{
  description = "kelkchoz repro dev env";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    dots = {
      url = "github:romain325/dots/develop";
      flake = false;
    };
    
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, dots, ... }: {
    nixosConfigurations = {
      "kelkchoz" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/kelkchoz/configuration.nix
	  home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.extraSpecialArgs = { inherit inputs; };
	    home-manager.backupFileExtension = "bak";
	    home-manager.users.kelkchoz = import ./home/kelkchoz/default.nix;
	  }
        ];
      };
    };
  };
}
