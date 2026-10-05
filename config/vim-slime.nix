{ ... }:

{
  keymaps = [
    { mode = [ "v" ]; key = "<localleader>ss"; action = "<plug>SlimeRegionSend"; }

    { mode = [ "n" ]; key = "<localleader>ss"; action = "<plug>SlimeLineSend"; }
    { mode = [ "n" ]; key = "<localleader>sp"; action = "<plug>SlimeParagraphSend"; }
    { mode = [ "n" ]; key = "<localleader>sc"; action = "<plug>SlimeSendCell"; } # %%
    { mode = [ "n" ]; key = "<localleader>sm"; action = "<plug>SlimeMotionSend"; }

    # jump between cells
    { mode = [ "n" "v" "o" ]; key = "]s"; action = "<cmd>call search('^# %%', 'W')<cr>"; options.silent = true; }
    { mode = [ "n" "v" "o" ]; key = "[s"; action = "<cmd>call search('^# %%', 'bW')<cr>"; options.silent = true; }
  ];

  plugins.vim-slime = {
    enable = true;
    settings = {
      target = "kitty";
      no_mappings = 1;
      bracketed_paste = 1;
    };
  };
}
