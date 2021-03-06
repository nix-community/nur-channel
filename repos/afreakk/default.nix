{ pkgs ? import <nixpkgs> { } }:
let
  tmuxHlp = import ./tmuxhelpers.nix { };
  self = {
    irc-link-informant = pkgs.callPackage ./pkgs/irc-link-informant {};
    realm-cli = pkgs.callPackage ./pkgs/realm-cli {};
    fish-history-merger = pkgs.callPackage ./pkgs/fish-history-merger {};
    qutebrowser-start-page = pkgs.callPackage ./pkgs/qutebrowser-start-page {};
    wowup = pkgs.callPackage ./pkgs/wowup { };
    strongdm = pkgs.callPackage ./pkgs/sdm { };
    dmenu-afreak = pkgs.callPackage ./pkgs/dmenu { };
    dmenuhist = pkgs.callPackage ./pkgs/dmenuhist { };
    dcreemer-1pass = pkgs.callPackage ./pkgs/dcreemer-1pass { };
    url-handler-tmux = tmuxHlp.mkDerivation rec {
      pluginName = "url-handler-tmux";
      # version = "lolx";
      # src = ~/coding/url-handler-tmux;
      version = "260432bef882b161a5a5314cdce17147af88c4c0";
      src = pkgs.fetchFromGitHub {
        owner = "afreakk";
        repo = pluginName;
        rev = version;
        sha256 = "1v4igddc3dijnygddsr6zs8664vwhl1v4lpfnb3xxpzlbfyb8j6b";
      };
    };
    modules = {
      fzf-fork = import ./modules/fzf-fork;
      strongdm = import ./modules/sdm;
      mcfly_with_fix = import ./modules/mcfly;
    };
  };
in
self
