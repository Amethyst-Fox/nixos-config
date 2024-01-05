{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/dbus.nix
    ./modules/system/pipewire.nix
    ./modules/system/network.nix
    ./modules/system/hyprland.nix
    ./modules/system/gaming.nix
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

  environment.systemPackages = with pkgs; [
    vscode
    neovim
    lf
    brave
  ];


  
}