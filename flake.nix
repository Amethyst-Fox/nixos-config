{
  description = "Amethyst's NixOS configuration";


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    nixosConfigurations = {
      Glados = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          ./glados/glados.nix
          ./modules/system/gaming.nix
          ./glados/hardware-configuration.nix
        ];
      };
      CaveJohnson = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          ./cavejohnson/cavejohnson.nix
          ./cavejohnson/hardware-configuration.nix
        ];
      };

    };
  };
}
