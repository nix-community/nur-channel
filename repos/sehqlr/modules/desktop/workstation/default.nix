{ config, pkgs, ... }: {
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  networking = {
      hostName = "workstation";
      interfaces = {
          wlp2s0.useDHCP = true;
      };
  };

  time.timeZone = "America/Chicago";

  services.vnstat.enable = true;
  environment.systemPackages = [ pkgs.vnstat ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver.wacom.enable = true;
}