# This file has been generated by node2nix 1.6.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {};
in
{
  ep_previewimages = nodeEnv.buildNodePackage {
    name = "ep_previewimages";
    packageName = "ep_previewimages";
    version = "0.0.9";
    src = fetchurl {
      url = "https://registry.npmjs.org/ep_previewimages/-/ep_previewimages-0.0.9.tgz";
      sha1 = "417d96249c50f8a59a1ef6c640e4ac98c26a106b";
    };
    buildInputs = globalBuildInputs;
    meta = {
      description = "Image previewer, paste the URL of an image or upload an image using ep_fileupload";
      homepage = https://github.com/JohnMcLear/ep_previewimages;
    };
    production = true;
    bypassCache = false;
  };
}