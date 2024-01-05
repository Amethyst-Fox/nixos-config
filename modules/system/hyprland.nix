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
    };
    displayManager.defaultSession = "hyprland";
  };

  environment.systemPackages = with pkgs; [
    waybar
    mako
    swww
    kitty
    rofi-wayland
  ];
}