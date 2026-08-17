{
  description = "Krosh's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, zen-browser, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      
      specialArgs = { inherit inputs; }; 
      
      modules = [
        ./hosts/laptop/hardware-configuration.nix
        ./hosts/laptop/configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.users.krosh = import ./home/krosh.nix;

          home-manager.backupFileExtension = "backup";
        }
      ];    
    };
  };
}
