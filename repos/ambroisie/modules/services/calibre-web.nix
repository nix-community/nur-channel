{ config, lib, ... }:
let
  cfg = config.my.services.calibre-web;
  domain = config.networking.domain;
  calibreDomain = "library.${domain}";
in
{
  options.my.services.calibre-web = with lib; {
    enable = mkEnableOption "Calibre-web server";

    port = mkOption {
      type = types.port;
      default = 8083;
      example = 8080;
      description = "Internal port for webui";
    };

    libraryPath = mkOption {
      type = with types; either path str;
      example = /data/media/library;
      description = "Path to the Calibre library to use";
    };
  };

  config = lib.mkIf cfg.enable {
    services.calibre-web = {
      enable = true;

      listen = {
        ip = "127.0.0.1";
        port = cfg.port;
      };

      group = "media";

      options = {
        calibreLibrary = cfg.libraryPath;
        enableBookConversion = true;
      };
    };

    services.nginx.virtualHosts."${calibreDomain}" = {
      forceSSL = true;
      useACMEHost = domain;

      locations."/".proxyPass = "http://127.0.0.1:${toString cfg.port}/";
    };

    my.services.backup = {
      paths = [
        "/var/lib/calibre-web" # For `app.db` and `gdrive.db`
        cfg.libraryPath
      ];
    };
  };
}
