# This file has been generated by node2nix 1.6.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {};
in
{
  ep_font_family = nodeEnv.buildNodePackage {
    name = "ep_font_family";
    packageName = "ep_font_family";
    version = "0.2.7";
    src = fetchurl {
      url = "https://registry.npmjs.org/ep_font_family/-/ep_font_family-0.2.7.tgz";
      sha1 = "a31c06b1684c7fd65c1d5bf96bcf99b6faa79893";
    };
    buildInputs = globalBuildInputs;
    meta = {
      description = "Add support for different Fonts";
      homepage = https://github.com/JohnMcLear/ep_font_family;
      license = "Apache-2.0";
    };
    production = true;
    bypassCache = false;
  };
}