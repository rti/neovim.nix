{ pkgs
, config
, ...
}: {
  imports = [
    ./opts.nix
    ./keymaps.nix
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
  ];

  config = {
    plugins = {
      auto-save.enable = true;
      web-devicons.enable = true;
      nvim-autopairs.enable = true;
      snacks.enable = true;
      snacks.settings.notifier.enable = true;
      illuminate.enable = true;
      which-key.enable = true;
      nvim-surround.enable = true;
    };

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

        autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=300}
      '';
  };
}
