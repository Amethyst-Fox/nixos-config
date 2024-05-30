{ config, pkgs, inputs, ... }:

{
  programs.steam.enable = true;
  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    lutris
    wine
    xivlauncher
    prismlauncher
    spotify
    protontricks
    inputs.nix-citizen.packages.${system}.star-citizen
    alvr
  ];

  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 16777216;
    "fs.file-max" = 524288;
  };
}