{ pkgs }:

let
  # Here mk stands for mark
  mkB0rked = pkgs.lib.addMetaAttrs { broken = true; };

in rec {
  inherit (pkgs) buildkite-agent3 consul dep2nix direnv exa ipfs;
  inherit (pkgs.gitAndTools) hub;

  mkBashCli = pkgs.callPackage ./make-bash-cli {
    inherit (import ../lib { inherit pkgs; }) grid;
  };

  buildkite-cli = pkgs.callPackage ./buildkite-cli { };
  consulate     = pkgs.callPackage ./consulate     { };
  emacs         = pkgs.callPackage ./emacs         { };

  fishPlugins = pkgs.recurseIntoAttrs (pkgs.callPackages ./fish-plugins { });

  img2ansi = pkgs.callPackage ./img2ansi   { };
  kraks    = pkgs.callPackage ./kreiscripts/kraks  { inherit mkBashCli; };
  krec2    = pkgs.callPackage ./kreiscripts/krec2  { inherit mkBashCli; };
  kretty   = pkgs.callPackage ./kreiscripts/kretty { inherit mkBashCli; };
  kurl     = pkgs.callPackage ./kreiscripts/kurl   { inherit mkBashCli; };
  lorri    = pkgs.callPackage ./lorri      { };
  nvim     = pkgs.callPackage ./nvim       { };
  oksh     = pkgs.callPackage ./ok.sh      { };
  pragmatapro = pkgs.callPackage ./pragmatapro.nix {};
  webhook  = pkgs.callPackage ./webhook    { };
  vgo2nix  = pkgs.callPackage ./vgo2nix    { };
  xinomorf = (pkgs.callPackage ./xinomorf  { }).cli;
}
