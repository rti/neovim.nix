{ ... }:

{
  keymaps = [
    # fugitive
    { mode = [ "n" "v" ]; key = "<localleader>gs"; action = "<cmd>vertical botright Git<cr>"; }

    # git-conflict
    { mode = [ "n" ]; key = "]x"; action = "<Plug>(git-conflict-next-conflict)"; }
    { mode = [ "n" ]; key = "[x"; action = "<Plug>(git-conflict-prev-conflict)"; }

    # MiniDiff
    { mode = [ "n" ]; key = "]c"; action = "<cmd>lua MiniDiff.goto_hunk('next')<cr>"; }
    { mode = [ "n" ]; key = "[c"; action = "<cmd>lua MiniDiff.goto_hunk('prev')<cr>"; }
    { mode = [ "n" ]; key = "<localleader>gp"; action = "<cmd>lua MiniDiff.toggle_overlay()<cr>"; }
    { mode = [ "n" ]; key = "<localleader>gR"; action = "<cmd>lua MiniDiff.do_hunks(0, 'reset')<cr>"; }

    # diffview
    { mode = [ "n" "v" ]; key = "<localleader>gd"; action = ":DiffviewOpen "; }
    { mode = [ "n" "v" ]; key = "<localleader>gS"; action = "<cmd>DiffviewOpen HEAD<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>gl"; action = "<cmd>DiffviewFileHistory<cr>"; }
  ];

  plugins = {
    # https://github.com/tpope/vim-fugitive
    fugitive.enable = true;

    # https://github.com/akinsho/git-conflict.nvim
    git-conflict = {
      enable = true;
      settings.default_mappings = false;
    };

    # https://github.com/echasnovski/mini.diff
    mini = {
      enable = true;
      modules.diff = {
        view = {
          style = "sign";

          signs = {
            add = "┃";
            change = "┃";
            delete = "┃";
          };
        };
      };
    };

    # https://github.com/akinsho/git-conflict.nvim
    diffview = {
      enable = true;
      enhancedDiffHl = true;
    };
  };
}
