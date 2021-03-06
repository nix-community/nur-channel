import ./lib/make-test.nix (
  { pkgs, ... }: {
    name = "overlays";
    nodes =
      let
        priegger-overlays = import ../overlays;
      in
      {
        default = { pkgs, ... }: {
          nixpkgs.overlays = builtins.attrValues priegger-overlays;

          environment.systemPackages = with pkgs; [
            brlaser
            cadvisor
            prometheus-nginx-exporter
            prometheus-pushgateway
          ];
        };
      };

    testScript =
      ''
        default.succeed("cadvisor --version 2>&1 | tee /dev/stderr | grep '0.38.7'")
        default.succeed(
            "(nginx-prometheus-exporter || true) 2>&1 | head -n1 | tee /dev/stderr | grep ' version=0.9.0 '"
        )
      '';
  }
)
