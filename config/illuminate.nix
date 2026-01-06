{
  plugins.illuminate = {
    enable = true;
    settings = {
      filetypes_denylist = [
        "dirbuf"
        "fugitive"
        "neo-tree"
      ];

      delay = 200;

      # only highlight two or more matches
      min_count_to_highlight = 2;
    };
  };

  extraConfigLua = ''
    local function setup_autohide_illuminate()
      vim.api.nvim_exec([[
        augroup active_window_buffer_illuminate
        autocmd!
        autocmd WinEnter,BufEnter * :IlluminateResume
        autocmd WinLeave,BufLeave * :IlluminatePause
        augroup END
      ]], false)
    end

    setup_autohide_illuminate()
  '';
}
