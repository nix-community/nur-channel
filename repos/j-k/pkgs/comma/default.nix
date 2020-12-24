{ stdenv
, makeWrapper
, fetchgit

, coreutils
, nix
, nix-index
, fzy

, overlayPackages ? [ ]
}:
let
  dependencies = [
    coreutils
    nix
    nix-index
    fzy
  ];
in
stdenv.mkDerivation rec {
  pname = "comma";
  version = "4a62ec17e20ce0e738a8e5126b4298a73903b468";

  src = fetchgit {
    url = "https://github.com/Shopify/${pname}.git";
    rev = "${version}";
    sha256 = "0n5a3rnv9qnnsrl76kpi6dmaxmwj1mpdd2g0b4n1wfimqfaz6gi1";
  };

  dontBuild = true;

  patches = [ ./improve_db.patch ];

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = dependencies;

  installPhase =
    let
      caseCondition = stdenv.lib.concatStringsSep "|" (overlayPackages ++ [ "--placeholder--" ]);
    in
    ''
      mkdir -p $out/bin
      sed -e 's/@OVERLAY_PACKAGES@/${caseCondition}/' < , > $out/bin/${pname}
      chmod +x $out/bin/${pname}
      wrapProgram "$out/bin/${pname}" \
        --set PATH ${stdenv.lib.makeBinPath dependencies}
      ln -s $out/bin/${pname} $out/bin/,
    '';

  meta = with stdenv.lib; {
    description = "Comma runs software without installing it.";
    longDescription = ''
      Basically it just wraps together nix run and nix-index.
      You stick a , in front of a command to run it from whatever location it happens to occupy in nixpkgs without really
      thinking about it.
    '';
    homepage = "https://github.com/Shopify/comma";
    maintainers = with maintainers; [ jk ];
    license = licenses.mit;
  };
}