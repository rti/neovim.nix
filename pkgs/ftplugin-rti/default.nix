{ pkgs, ... }:

pkgs.stdenvNoCC.mkDerivation {
  name = "ftplugin-rti";
  src = ./.;
  installPhase = ''
    mkdir -p $out/ftplugin
    cp -v $src/*.vim $out/ftplugin/
  '';
}

