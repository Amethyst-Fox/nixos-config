{ config, pkgs, ...}:

{
  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" ];

  # Allow ALVR ports in firewall
  networking.firewall.allowedTCPPorts = [ 8082 9943 9944 ];
  networking.firewall.allowedUDPPorts = [ 8082 9943 9944 ];   
}