{ pkgs
, config
, ...
}: {
  imports = [
    ./opts.nix
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
    keymaps = [
      # Vim convenience
      { mode = [ "n" "v" "t" ]; key = "<localleader>o"; action = "<cmd>only<cr>"; }
      { mode = [ "n" "v" "t" ]; key = "<localleader>q"; action = "<cmd>q<cr>"; }
      { mode = [ "n" "v" "t" ]; key = "<localleader>Q"; action = "<cmd>qa!<cr>"; }
      { mode = [ "n" ]; key = "K"; action = "i<cr><esc>"; }

      # Window navigation
      { mode = [ "n" "v" ]; key = "<m-h>"; action = "<c-w>h"; }
      { mode = [ "n" "v" ]; key = "<m-l>"; action = "<c-w>l"; }
      { mode = [ "n" "v" ]; key = "<m-j>"; action = "<c-w>j"; }
      { mode = [ "n" "v" ]; key = "<m-k>"; action = "<c-w>k"; }

      { mode = "t"; key = "<m-h>"; action = "<c-\\><c-n><c-w>h"; }
      { mode = "t"; key = "<m-l>"; action = "<c-\\><c-n><c-w>l"; }
      { mode = "t"; key = "<m-j>"; action = "<c-\\><c-n><c-w>j"; }
      { mode = "t"; key = "<m-k>"; action = "<c-\\><c-n><c-w>k"; }
      { mode = "t"; key = "<esc>"; action = "<c-\\><c-n>"; }
    ];

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
      for type, icon in pairs({ Hint = "", Info = "", Warn = "", Error = "", }) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

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
