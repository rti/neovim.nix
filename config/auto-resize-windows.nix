{ ... }:

{
  extraConfigLua = ''
    vim.api.nvim_create_autocmd({ "VimResized", "CursorHoldI" }, {
      callback = function()
        vim.cmd("wincmd =")
      end,
    })
  '';
}
