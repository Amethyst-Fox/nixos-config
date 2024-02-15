{ config, pkgs, ... }:

{
  networking.hostName = "CaveJohnson";

  boot.loader.systemd-boot.enable = true;
}