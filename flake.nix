{
  description = "Amethyst's NixOS configuration";


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    lobster.url = "github:justchokingaround/lobster";
  };

  outputs = inputs@{ self, nixpkgs, ... }: {

    nixosConfigurations = {
      Glados = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./glados/glados.nix
          ./modules/system/gaming.nix
          ./glados/hardware-configuration.nix
        ];
      };
      CaveJohnson = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./cavejohnson/cavejohnson.nix
          ./cavejohnson/hardware-configuration.nix
        ];
      };

    };
  };
}
