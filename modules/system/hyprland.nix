{ config, pkgs, ...}:

{
  imports = [
    ./pipewire.nix
    ./dbus.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.xserver = {
    enable = true;
    layout = "us";
    displayManager.gdm = {
      enable = true;
      wayland = true;
      defaultSession = "hyprland";
    };
  }
}