{
  description = "Amethyst's NixOS configuration";

  imports = [
    ./hardware-configuration.nix
  ];

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs }: {

    nixosConfigurations = {
      Glados = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./configuration.nix
        ];
        networking.hostName = "glados";
      };

    };
  };
}
