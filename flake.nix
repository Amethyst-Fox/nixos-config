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
          ./glados.nix
        ];
      };

    };
  };
}
