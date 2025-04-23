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

      # fugitive
      { mode = [ "n" "v" "t" ]; key = "<localleader>gs"; action = "<cmd>vertical botright Git<cr>"; }

      # CamelCaseMotion
      { mode = [ "n" "v" "t" ]; key = ",w"; action = "<plug>CamelCaseMotion_w"; }
      { mode = [ "n" "v" "t" ]; key = ",b"; action = "<plug>CamelCaseMotion_b"; }
      { mode = [ "n" "v" "t" ]; key = ",e"; action = "<plug>CamelCaseMotion_e"; }
      { mode = [ "n" "v" "t" ]; key = ",ge"; action = "<plug>CamelCaseMotion_ge"; }
    ];

    plugins = {
      auto-save.enable = true;
      web-devicons.enable = true;
      nvim-autopairs.enable = true;
      snacks.enable = true;
      snacks.settings.notifier.enable = true;
      gitsigns.enable = true;
      fugitive.enable = true;
      illuminate.enable = true;
      which-key.enable = true;
      git-conflict.enable = true;
      nvim-surround.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      camelcasemotion
    ];

    extraPackages = with pkgs; [ ripgrep curl ];

    extraConfigLua = ''
      for type, icon in pairs({ Hint = "", Info = "", Warn = "", Error = "", }) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local function setup_autohide_cursorline()
        vim.api.nvim_exec([[
        augroup noclc_active_window_buffer_cursorline
        autocmd!
        autocmd WinEnter,BufEnter * if &filetype != 'dashboard' && &filetype != 'DiffviewFiles' | setlocal cursorline | endif
        autocmd WinLeave,BufLeave * if &filetype != 'dashboard' && &filetype != 'DiffviewFiles' | setlocal nocursorline | endif
        augroup END
        ]], false)
      end

      setup_autohide_cursorline()

      vim.api.nvim_create_autocmd({ "VimResized", "CursorHoldI" }, {
        callback = function()
          vim.cmd("wincmd =")
        end,
      })

      local function disable_llama_debug()
        vim.cmd([[let g:llama_config.show_info = v:false]])
      end
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
