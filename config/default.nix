{ pkgs
, config
, ...
}: {
  imports = [
    ./opts.nix
    ./keymaps.nix
    ./plugins.nix
    ./colorscheme.nix
    ./ftplugin.nix
    ./treesitter.nix
    ./lsp.nix
    ./blink.nix
    ./lualine.nix
    ./telescope.nix
    ./neo-tree.nix
    ./dashboard.nix
    ./noice.nix
    ./llama.nix
    ./camelcasemotion.nix
    ./git.nix
    ./vim-slime.nix
    ./autohide-cursorline.nix
    ./highlight-yank.nix
  ];

  config = {
    extraConfigLua = ''
      vim.api.nvim_create_autocmd({ "VimResized", "CursorHoldI" }, {
        callback = function()
          vim.cmd("wincmd =")
        end,
      })
    '';

  };
}
