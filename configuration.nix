{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./system/dbus.nix
    ./system/pipewire.nix
    ./system/network.nix
    ./system/hyprland.nix
  ];

  # Ensure Nix flakes are used
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  boot.loader.grub = {
    enable = true;
    device = "/dev/nvme0n1";
    useOSProber = true;
  };
  
}