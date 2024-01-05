{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./system/dbus.nix
    ./system/pipewire.nix
    ./system/network.nix
    ./system/hyprland.nix
    ./system/gaming.nix
  ];

  # Ensure Nix flakes are used
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Allow unfree packages :(
  nixpkgs.config.allowUnfree = true;

  boot.loader.grub = {
    enable = true;
    device = "/dev/nvme0n1";
    useOSProber = true;
  };

  # Users
  users.users = {
    vivians = {
      initialPassword = "passwordFUCK";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
      ];
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };


  
}