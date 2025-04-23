{ pkgs, config, ... }:
let
  colors-rti = import ../pkgs/colors-rti { inherit config pkgs; };
in
{
  config = {
    extraConfigVim = ''
      set rtp+=${colors-rti}
      colorscheme rti
    '';
  };
}
