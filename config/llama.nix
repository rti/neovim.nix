{ pkgs, ... }:

{
  extraPlugins = [
    pkgs.vimPlugins.llama-vim
  ];

  extraConfigLua = ''
    local function disable_llama_debug()
      vim.cmd([[
        let g:llama_config.show_info = v:false
        let g:llama_config.keymap_accept_word = "<C-F>"
        let g:llama_config.keymap_accept_line = "<C-G>"
        let g:llama_config.keymap_accept_full = "<S-Tab>"
      ]])
    end

    vim.defer_fn(disable_llama_debug, 1000)

    -- free the CTRL-G keymap in insert mode
    vim.api.nvim_del_keymap("i", "<C-G>s")
    vim.api.nvim_del_keymap("i", "<C-G>S")
  '';

  extraPackages = with pkgs; [ curl ];
}
