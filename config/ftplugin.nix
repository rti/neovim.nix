{ config, pkgs, ... }:

{
  extraConfigVim =
    let
      ftplugin-rti = import ../pkgs/ftplugin-rti { inherit config pkgs; };
    in
    ''
      set rtp+=${ftplugin-rti}
    '';
}
