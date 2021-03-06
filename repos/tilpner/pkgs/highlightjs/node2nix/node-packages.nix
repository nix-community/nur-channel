# This file has been generated by node2nix 1.5.1. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {};
in
{
  highlightjs = nodeEnv.buildNodePackage {
    name = "highlightjs";
    packageName = "highlightjs";
    version = "9.10.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/highlightjs/-/highlightjs-9.10.0.tgz";
      sha1 = "fca9b78ddaa3b1abca89d6c3ee105ad270a80190";
    };
    buildInputs = globalBuildInputs;
    meta = {
      description = "Syntax highlighting for the Web";
      license = "BSD-3-Clause";
    };
    production = true;
    bypassCache = true;
  };
}