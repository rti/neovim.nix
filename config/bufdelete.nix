{ ... }:

{
  plugins.bufdelete.enable = true;

  keymaps = [
    { mode = [ "n" ]; key = "<localleader>db"; action = "<cmd>Bdelete<cr>"; }
  ];
}
