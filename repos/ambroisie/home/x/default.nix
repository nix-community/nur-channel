{ config, lib, pkgs, ... }:
let
  cfg = config.my.home.x;
in
{
  imports = [
    ./cursor.nix
    ./keyboard.nix
  ];

  options.my.home.x = with lib; {
    enable = mkEnableOption "X server configuration";
  };

  config = lib.mkIf cfg.enable {
    xsession.enable = true;

    home.packages = with pkgs; [
      xsel
    ];
  };
}
