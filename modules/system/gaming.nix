{ config, pkgs, ... }:

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
  ];
}