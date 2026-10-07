{
  description = "Krosh's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    codex-desktop-linux.url = "github:ilysenko/codex-desktop-linux";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      zen-browser,
      home-manager,
      codex-desktop-linux,
      ...
    }@inputs:
    {
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

            home-manager.sharedModules = [
              codex-desktop-linux.homeManagerModules.default
            ];
          }
        ];
      };
    };
}
