{ pkgs, ... }:

{
  extraPlugins = [
    pkgs.vimPlugins.llama-vim
  ];

  extraConfigLua = ''
    local function disable_llama_debug()
      vim.cmd([[
        let g:llama_config.show_info = v:false
        let g:llama_config.keymap_accept_full = "<C-Tab>"
        let g:llama_config.keymap_accept_line = "<Right>"
        let g:llama_config.keymap_accept_word = "<C-F>"
      ]])
    end

    vim.defer_fn(disable_llama_debug, 1000)
  '';

  extraPackages = with pkgs; [ curl ];
}
