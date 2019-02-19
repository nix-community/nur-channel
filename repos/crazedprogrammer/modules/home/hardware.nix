{ config, pkgs, lib, ... }:

{
  boot = {
    # Quiet console at startup.
    kernelParams = [ "quiet" "vga=current" ];
    # Make the BFQ scheduler available in initrd.
    initrd.kernelModules = [ "bfq" ];
  };
  # Use the BFQ scheduler for all block devices that are not rotational.
  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="bfq"
  '';

  # /tmp on tmpfs.
  fileSystems."/tmp" = {
    fsType = "tmpfs";
    device = "tmpfs";
    options = [ "mode=1777" "strictatime" "nosuid" "nodev" "size=12g" ];
  };

  networking = {
    # Use NetworkManager for networking.
    networkmanager.enable = true;

    # Extra hosts.
    extraHosts = ''
      91.205.173.25 argon
    '';
  };

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  # Improve boot time by not waiting for the network and time sync to come up.
  systemd.services."network-manager" = {
    wantedBy = lib.mkForce [ ];
  };
  systemd.services."systemd-timesyncd" = {
    wantedBy = lib.mkForce [ ];
  };
  # Yes, this is a hack.
  services.xserver.displayManager.sddm.setupScript = "${pkgs.systemd}/bin/systemctl start network-manager systemd-timesyncd";

  hardware = {
    # Enable PulseAudio.
    pulseaudio.enable = true;

    # 32 bit compatibility for Steam.
    opengl.driSupport32Bit = true;
    pulseaudio.support32Bit = true;
  };

  # Systemd stop job timeout.
  # Increase max file descriptors to 1M,
  systemd.extraConfig = ''
    DefaultLimitNOFILE=1048576
    DefaultTimeoutStartSec=10s
    DefaultTimeoutStopSec=10s
  '';
  security.pam.loginLimits = [{
    domain = "*";
    type = "hard";
    item = "nofile";
    value = "1048576";
  }];
}
