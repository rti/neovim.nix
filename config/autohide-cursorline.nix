{ ... }:

{
  extraConfigLua = ''
    local function setup_autohide_cursorline()
      vim.api.nvim_exec([[
      augroup noclc_active_window_buffer_cursorline
      autocmd!
      autocmd WinEnter,BufEnter * if &filetype != 'dashboard' && &filetype != 'DiffviewFiles' && &filetype != 'DiffviewFileHistory' && &filetype != 'neo-tree' && &filetype != 'qf' | setlocal cursorline | endif
      autocmd WinLeave,BufLeave * if &filetype != 'dashboard' && &filetype != 'DiffviewFiles' && &filetype != 'DiffviewFileHistory' && &filetype != 'neo-tree' && &filetype != 'qf' | setlocal nocursorline | endif
      augroup END
      ]], false)
    end

    setup_autohide_cursorline()
  '';
}
