{ pkgs, ... }: 
# FIXME: buggy graphics. Other DirectX implementations are glitching and the stock one have buggy colors.
let
  bin = pkgs.wrapWine {
    name = "watchdogs2";
    is64bits = true;
    executable = "/run/media/lucasew/Dados/DADOS/Jogos/Watch Dogs 2/bin/WatchDogs2.exe";
    wineFlags = "explorer /desktop=name,1366x768";
    chdir = "/run/media/lucasew/Dados/DADOS/Jogos/Watch Dogs 2/bin/";
    tricks = [
      # "d3dx10"
      # "d3dx11_43"
      # "d3dcompiler_47"
      "d9dx"
    ];
  };
in bin
