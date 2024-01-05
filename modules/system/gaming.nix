{ config, pkgs, ... }:

{
  programs.steam.enable = true;
  hardware.steam-hardware.enable = true;

  enviroment.systemPackages = with pkgs; [
    vesktop
    lutris
    wine
    xivlauncher
    yuzu-mainline
    prismlauncher
  ]
}