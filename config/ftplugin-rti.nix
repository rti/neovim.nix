{ pkgs, ... }:

pkgs.stdenvNoCC.mkDerivation {
  name = "ftplugin-rti";
  src = ./ftplugin;
  installPhase = ''
    mkdir $out
    cp -R $src $out/ftplugin
  '';
}

