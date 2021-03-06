# This file was generated by https://github.com/kamilchm/go2nix v1.3.0
{ stdenv, buildGoPackage, fetchgit, fetchhg, fetchbzr, fetchsvn }:

buildGoPackage rec {
  name = "geocatalogo-unstable-${version}";
  version = "2018-03-28";
  rev = "f3dcee2fdd3c2226ef4f3b32ab726038a38df448";

  goPackagePath = "github.com/go-spatial/geocatalogo";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/go-spatial/geocatalogo";
    sha256 = "0zg7ysxf6820fwzqw1wnsgpmpy817xa4fgi7571568q1rqr674qj";
  };

  goDeps = ./deps.nix;

  # TODO: add metadata https://nixos.org/nixpkgs/manual/#sec-standard-meta-attributes
  meta = {
  };
}
