# If called without explicitly setting the 'pkgs' arg, a pinned nixpkgs version is used by default.
{ pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/21.05.tar.gz";
    sha256 = "1ckzhh24mgz6jd1xhfgx0i9mijk6xjqxwsshnvq789xsavrmsc36";
  }) {}
, debug ? false
}:

let
  nur-pkgs = import ./nur.nix { inherit pkgs debug; };
  master-pkgs = rec {
    batsched-master = pkgs.callPackage ./pkgs/batsched/master.nix { inherit debug; intervalset = nur-pkgs.intervalset; loguru = nur-pkgs.loguru; redox = nur-pkgs.redox; };

    batexpe-master = pkgs.callPackage ./pkgs/batexpe/master.nix { batexpe = nur-pkgs.batexpe; };

    batsim-master = pkgs.callPackage ./pkgs/batsim/master.nix { inherit debug; intervalset = nur-pkgs.intervalset; redox = nur-pkgs.redox; simgrid = nur-pkgs.simgrid-light; };
    batsim-docker-master = pkgs.callPackage ./pkgs/batsim/batsim-docker.nix { batsim = batsim-master; };

    pybatsim-master = pkgs.callPackage ./pkgs/pybatsim/master.nix { pybatsim = nur-pkgs.pybatsim; };

    rsg-master = pkgs.callPackage ./pkgs/remote-simgrid/master.nix { rsg = nur-pkgs.rsg; };

    simgrid-master = pkgs.callPackage ./pkgs/simgrid/master.nix { simgrid = nur-pkgs.simgrid; };
    simgrid-light-master = pkgs.callPackage ./pkgs/simgrid/master.nix { simgrid = nur-pkgs.simgrid-light; };
  };
in
  nur-pkgs // master-pkgs
