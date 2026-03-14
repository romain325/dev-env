{ pkgs, ... }:

{
  hardware.graphics.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  services.xserver.videoDrivers = [ "vmware" ];
}
