{ config, pkgs, ... }:

{
  imports = [
    ./modules/system/dbus.nix
    ./modules/system/pipewire.nix
    ./modules/system/network.nix
    ./modules/system/kde.nix
    ./modules/system/virtualisation.nix
    ./modules/system/udev.nix
    ./modules/system/lobster.nix
  ];

  # Ensure Nix flakes are used
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Set time zone
  time.timeZone = "America/New_York";

  # Enable ZRAM
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryMax = 16000000000;
  };

  # Allow unfree packages :(
  nixpkgs.config.allowUnfree = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

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
    git
    krita
    mpv
    hyfetch
    vimPlugins.nvchad
    pavucontrol
    keymapp
    appimage-run
  ];


  
}