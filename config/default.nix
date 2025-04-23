{ pkgs
, config
, ...
}: {
  imports = [
    ./opts.nix
    ./keymaps.nix
    ./plugins.nix
    ./treesitter.nix
    ./lualine.nix
    ./blink.nix
    ./vim-slime.nix
    ./noice.nix
    ./dashboard.nix
    ./telescope.nix
    ./neo-tree.nix
    ./lsp.nix
    ./llama.nix
    ./autohide-cursorline.nix
    ./camelcasemotion.nix
    ./git.nix
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

    extraConfigVim =
      let
        colors-rti = import ./colors-rti.nix { inherit config pkgs; };
        ftplugin-rti = import ./ftplugin-rti.nix { inherit config pkgs; };
      in
      ''
        set rtp+=${colors-rti},${ftplugin-rti}
        colorscheme rti
      '';
  };
}
