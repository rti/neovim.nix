{ ... }:

{
  keymaps = [
    # Vim convenience
    { mode = [ "n" "v" "t" ]; key = "<localleader>o"; action = "<cmd>only<cr>"; }
    { mode = [ "n" "v" "t" ]; key = "<localleader>q"; action = "<cmd>q<cr>"; }
    { mode = [ "n" "v" "t" ]; key = "<localleader>Q"; action = "<cmd>qa!<cr>"; }
    { mode = [ "n" ]; key = "K"; action = "i<cr><esc>"; }

    # Window navigation
    { mode = [ "n" "v" ]; key = "<m-h>"; action = "<c-w>h"; }
    { mode = [ "n" "v" ]; key = "<m-l>"; action = "<c-w>l"; }
    { mode = [ "n" "v" ]; key = "<m-j>"; action = "<c-w>j"; }
    { mode = [ "n" "v" ]; key = "<m-k>"; action = "<c-w>k"; }

    { mode = "t"; key = "<m-h>"; action = "<c-\\><c-n><c-w>h"; }
    { mode = "t"; key = "<m-l>"; action = "<c-\\><c-n><c-w>l"; }
    { mode = "t"; key = "<m-j>"; action = "<c-\\><c-n><c-w>j"; }
    { mode = "t"; key = "<m-k>"; action = "<c-\\><c-n><c-w>k"; }
    { mode = "t"; key = "<esc>"; action = "<c-\\><c-n>"; }
  ];
}
