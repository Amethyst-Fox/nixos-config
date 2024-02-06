{ config, pkgs, lobster, ... }: 

{
  environment.systemPackages = [
    inputs.lobster.packages.x86_64.lobster
  ];
}