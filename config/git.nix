{ ... }:

{
  keymaps = [
    # fugitive
    { mode = [ "n" "v" ]; key = "<localleader>gs"; action = "<cmd>vertical botright Git<cr>"; }

    # git-conflict
    { mode = [ "n" ]; key = "]x"; action = "<Plug>(git-conflict-next-conflict)"; }
    { mode = [ "n" ]; key = "[x"; action = "<Plug>(git-conflict-prev-conflict)"; }

    # gitsigns
    { mode = [ "n" ]; key = "]c"; action = "<cmd>Gitsigns next_hunk<cr>"; }
    { mode = [ "n" ]; key = "[c"; action = "<cmd>Gitsigns prev_hunk<cr>"; }
    { mode = [ "n" ]; key = "<localleader>gp"; action = "<cmd>Gitsigns preview_hunk_inline<cr>"; }
    { mode = [ "n" ]; key = "<localleader>g-"; action = "<cmd>Gitsigns stage_hunk<cr>"; }
    { mode = [ "n" ]; key = "<localleader>gu"; action = "<cmd>Gitsigns undo_stage_hunk<cr>"; }

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

    # https://github.com/lewis6991/gitsigns.nvim
    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };

    # https://github.com/akinsho/git-conflict.nvim
    diffview = {
      enable = true;
      enhancedDiffHl = true;
    };
  };
}
