{ ... }:

{
  keymaps = [
    # fugitive
    { mode = [ "n" "v" "t" ]; key = "<localleader>gs"; action = "<cmd>vertical botright Git<cr>"; }
  ];

  plugins = {
    gitsigns.enable = true;
    fugitive.enable = true;
    git-conflict.enable = true;
  };
}
