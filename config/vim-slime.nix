{ ... }:

{
  keymaps = [
    { mode = [ "n" ]; key = "<localleader>sp"; action = "<plug>SlimeParagraphSend"; } # could this be ss too?
    { mode = [ "v" ]; key = "<localleader>ss"; action = "<plug>SlimeRegionSend"; }
    { mode = [ "n" ]; key = "<localleader>ss"; action = "<plug>SlimeMotionSend"; }
    { mode = [ "n" ]; key = "<localleader>sc"; action = "<plug>SlimeSendCell"; }
    { mode = [ "n" ]; key = "<localleader>sl"; action = "<plug>SlimeLineSend"; }
  ];

  plugins.vim-slime = {
    enable = true;
    settings = {
      target = "kitty";
      no_mappings = 1;
    };
  };
}
