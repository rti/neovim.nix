{ pkgs, ... }:

{
  extraPackages = with pkgs; [ git-absorb ];

  keymaps = [
    # neogit
    { mode = [ "n" "v" ]; key = "<localleader>gs"; action = "<cmd>Neogit<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>gl"; action = ":lua require('neogit').action('log', 'log_head', {'--graph', '--decorate'})()<cr>"; }

    # git-conflict
    { mode = [ "n" ]; key = "]x"; action = "<Plug>(git-conflict-next-conflict)"; }
    { mode = [ "n" ]; key = "[x"; action = "<Plug>(git-conflict-prev-conflict)"; }

    # gitsigns
    { mode = [ "n" ]; key = "]c"; action = "<cmd>Gitsigns next_hunk<cr>"; }
    { mode = [ "n" ]; key = "[c"; action = "<cmd>Gitsigns prev_hunk<cr>"; }
    { mode = [ "n" ]; key = "<localleader>gp"; action = "<cmd>Gitsigns preview_hunk_inline<cr>"; }
    { mode = [ "n" ]; key = "<localleader>g-"; action = "<cmd>Gitsigns stage_hunk<cr>"; }
    { mode = [ "n" ]; key = "<localleader>gu"; action = "<cmd>Gitsigns undo_stage_hunk<cr>"; }
    { mode = [ "n" ]; key = "<localleader>gX"; action = "<cmd>Gitsigns reset_hunk<cr>"; }
    { mode = [ "n" ]; key = "<localleader>gb"; action = "<cmd>Gitsigns blame<cr>"; }

    # diffview
    { mode = [ "n" "v" ]; key = "<localleader>gd"; action = ":DiffviewOpen "; }
    { mode = [ "n" "v" ]; key = "<localleader>gS"; action = "<cmd>DiffviewOpen HEAD<cr>"; }
    # { mode = [ "n" "v" ]; key = "<localleader>gl"; action = "<cmd>DiffviewFileHistory<cr>"; }
    # { mode = [ "n" "v" ]; key = "<localleader>gf"; action = "<cmd>DiffviewFileHistory %<cr>"; }
  ];

  plugins = {
    # https://github.com/NeogitOrg/neogit
    neogit = {
      enable = true;
      settings = {
        disable_builtin_notifications = true;
        disable_commit_confirmation = true;
        disable_context_highlighting = true;
        disable_insert_on_commit = true;

        graph_style = "kitty";

        kind = "vsplit";

        integrations = {
          diffview = true;
        };

        signs = {
          # { CLOSED, OPENED }
          hunk = [ "" "" ];
          item = [ "" "" ];
          section = [ "" "" ];
        };

        mappings = {
          popup = {
            "g?" = "HelpPopup";
            "?" = false;
            "q" = false;
          };
          # finder = { "<esc>" = false; };
          # commit_view = { "<esc>" = false; };

          commit_view = {
            "gf" = "OpenFileInWorktree";
            # "q" = false; # no effect. why?
          };
          commit_editor = {
            # "q" = false; # no effect. why?
          };
        };

        commit_editor = {
          kind = "vsplit";
          show_staged_diff = true;
          staged_diff_split_kind = "split";
        };
        commit_popup.kind = "split";
        commit_select.kind = "split";
        popup.kind = "split";
        preview_buffer.kind = "split";
      };
    };

    # https://github.com/akinsho/git-conflict.nvim
    git-conflict = {
      enable = true;
      settings.default_mappings = false;
    };

    # https://github.com/lewis6991/gitsigns.nvim
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = false;
        sign_priority = 20; # always in front
      };
    };

    # https://github.com/akinsho/git-conflict.nvim
    diffview = {
      enable = true;
      settings.enhanced_diff_hl = true;
    };

    # https://github.com/pwntester/octo.nvim
    octo.enable = true;
  };
}
