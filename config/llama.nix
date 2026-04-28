{ pkgs, ... }:


{
  extraPlugins = [
    pkgs.vimPlugins.llama-vim
  ];

  extraConfigLua = ''
    vim.cmd([[
      if !exists('g:llama_config')
        let g:llama_config={}
      endif

      " free the CTRL-G keymap in insert mode
      "iunmap <C-G>s
      "iunmap <C-G>S

      let g:llama_config.show_info = v:false
      let g:llama_config.keymap_fim_accept_word = "<C-F>"
      let g:llama_config.keymap_fim_accept_line = "<C-G>"
      let g:llama_config.keymap_fim_accept_full = "<S-Tab>"

      " work around hanging space
      " https://github.com/ggml-org/llama.vim/blob/a1c8e6e40cb45df59b78add5b65d575386832465/autoload/llama.vim#L359
      let g:llama_config.keymap_fim_trigger = ""
    ]])

    -- free the CTRL-G keymap in insert mode
    vim.api.nvim_del_keymap("i", "<C-G>s")
    vim.api.nvim_del_keymap("i", "<C-G>S")
  '';

  extraPackages = with pkgs; [ curl ];
}
