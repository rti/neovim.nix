{
  extraConfigLua = ''
    -- execute current line as Lua
    vim.keymap.set('n', '<leader>xl', function()
      local line = vim.api.nvim_get_current_line()
      local func = loadstring(line)
      if func then
        func()
      else
        print("Error: Invalid Lua code")
      end
    end, { desc = "Execute current line as Lua" })

    -- execute selection as Lua
    vim.keymap.set('v', '<leader>xl', ':lua<CR>')
  '';
}
