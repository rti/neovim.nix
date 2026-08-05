{ pkgs, ... }:

{
  extraPackages = with pkgs; [ git-absorb ];
  extraPlugins = [pkgs.vimPlugins.vim-flog];

  keymaps = [
    # fugitive
    { mode = [ "n" "v" ]; key = "<localleader>gs"; action = "<cmd>vert rightbelow G<cr>"; }

    # vim-flog
    { mode = [ "n" "v" ]; key = "<localleader>gl"; action = "<cmd>rightbelow Flogsplit -auto-update -date=short<cr>"; }

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
    { mode = [ "n" "v" ]; key = "<localleader>gD"; action = "<cmd>DiffviewOpen origin/HEAD...<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>gS"; action = "<cmd>DiffviewOpen HEAD<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>gL"; action = "<cmd>DiffviewFileHistory<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>gf"; action = "<cmd>DiffviewFileHistory %<cr>"; }
  ];

  plugins = {
    fugitive = {
      enable = true;
    };

    gitlinker = {
      enable = true;
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

  # TODO: edit clears the fugitive git status buffer when used with BufWritePost
  # TODO: G resets the cursor position
  # TODO: pushed commits are not updated when pushing from the commandline outside vim
  extraConfigLua = ''
    -- update fugitive status buffer on .git/index change
    local watcher = vim.uv.new_fs_event()
    watcher:start(".git", {}, vim.schedule_wrap(function()
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].filetype == "fugitive" then
          vim.api.nvim_buf_call(buf, function()
            vim.cmd("silent! edit")
          end)
        end
      end
    end))

    -- update fugitive status buffer on file write
    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype == "fugitive" then
            vim.api.nvim_buf_call(buf, function()
              vim.cmd("silent! G")
            end)
          end
        end
      end,
    })
  '';
}
