{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./system/dbus.nix
    ./system/pipewire.nix
    ./system/network.nix
    ./system/hyprland.nix
  ];
  
}