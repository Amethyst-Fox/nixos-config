{ config, pkgs, ... }:

{
  networking.hostName = "CaveJohnson";

  boot.loader.grub = {
    enable = true;
    device = "/dev/nvme0n1p1";
    useOSProber = true;
  };
}