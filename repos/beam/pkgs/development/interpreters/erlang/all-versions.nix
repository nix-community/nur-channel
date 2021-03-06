{ pkgs, fetchpatch, callPackage, wxGTK30, openssl_1_1, lib, util }:

let
  beamLib = callPackage ../../beam-modules/lib.nix { };

  overrideFeature = basePkg: featureString: featureFlag:
    let
      pkgPath = util.makePkgPath "v" basePkg.version featureString;
      pkgName = util.makePkgName "erlang-" basePkg.version featureString;

      featurePkg = basePkg.override featureFlag;
      namedPkg = featurePkg.overrideAttrs (o: { name = pkgName; });
    in {
      name = pkgPath;
      value = namedPkg;
    };

  deriveErlangFeatureVariants = release: buildOpts: variantOpts:
    let basePkg = beamLib.callErlang release buildOpts;
    in lib.attrsets.mapAttrs' (overrideFeature basePkg) variantOpts;

  folders = builtins.attrNames
    (lib.attrsets.filterAttrs (_: type: type == "directory")
      (builtins.readDir ./.));
  majorVersions = map (f: ./. + ("/" + f)) folders;

  releasesPerMajorVersion =
    map (r: callPackage r { inherit beamLib util deriveErlangFeatureVariants; })
    majorVersions;

in util.mergeListOfAttrs releasesPerMajorVersion
