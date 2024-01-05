{ config, pkgs, ...}:

{

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