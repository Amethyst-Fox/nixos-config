{ config, pkgs, ... }:

{
  networking.hostName = "CaveJohnson";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
