{
  description = "Amethyst's NixOS configuration";


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    lobster.url = "github:justchokingaround/lobster";

    nix-citizen.url = "github:LovingMelody/nix-citizen";

    # Optional - updates underlying without waiting for nix-citizen to update
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-citizen.inputs.nix-gaming.follows = "nix-gaming";
  };

  outputs = { self, nixpkgs, ... }@inputs: {

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
