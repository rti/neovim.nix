{ pkgs
, config
, ...
}: {
  imports = [ ./opts.nix ];

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

      # Telescope
      { mode = [ "n" "v" "t" ]; key = "<localleader>ff"; action = "<cmd>Telescope find_files<cr>"; }
      { mode = [ "n" "v" "t" ]; key = "<localleader>fg"; action = "<cmd>Telescope live_grep<cr>"; }
      { mode = [ "n" "v" "t" ]; key = "<localleader>fb"; action = "<cmd>Telescope oldfiles<cr>"; }

      # LSP and LSP Format
      { mode = "n"; key = "<localleader>lf"; action = "<cmd>lua vim.lsp.buf.format({async=true})<cr>"; }
      { mode = "v"; key = "<localleader>lf"; action = "<cmd>lua vim.lsp.buf.range_formatting()<cr>"; }
      { mode = "n"; key = "<c-h>"; action = "<cmd>lua vim.lsp.buf.hover()<cr>"; }

      # Neotree
      { mode = [ "n" "v" "t" ]; key = "<localleader>n"; action = "<cmd>Neotree reveal toggle<cr>"; }
      { mode = [ "n" "v" "t" ]; key = "<localleader>b"; action = "<cmd>Neotree buffers toggle<cr>"; }

      # fugitive
      { mode = [ "n" "v" "t" ]; key = "<localleader>gs"; action = "<cmd>vertical botright Git<cr>"; }
    ];

    plugins = {
      treesitter.enable = true;
      ts-context-commentstring.enable = true;

      lualine = {
        enable = true;
        settings.options = {
          theme = "rti";
          disabled_filetypes = [ "neo-tree" "fugitive" ];
          component_separators = { left = ""; right = ""; };
          section_separators = { left = ""; right = ""; };
        };
      };

      blink-cmp = {
        enable = true;
        settings = {
          cmdline = {
            keymap = {
              "<C-space>" = [ "show" ];
              "<C-y>" = [ "select_and_accept" ];
              "<cr>" = [ "select_and_accept" "fallback" ];
              "<C-e>" = [ "hide" ];
              "<C-n>" = [ "select_next" "fallback" ];
              "<C-p>" = [ "select_prev" "fallback" ];
              "<Down>" = [ "select_next" "fallback" ];
              "<Up>" = [ "select_prev" "fallback" ];
              # "<Tab>" = [ "show" "accept" ];
            };
            completion = {
              ghost_text = {
                enabled = false;
              };
              menu = {
                auto_show = {
                  __raw = "function(ctx) return vim.fn.getcmdtype() == ':' end";
                };
              };
            };
          };
          completion = {
            menu.auto_show = true;
            menu.border = "rounded";
            documentation.window.border = "rounded";
            documentation.auto_show = true;
            documentation.auto_show_delay_ms = 0;
          };
          keymap = {
            "<C-b>" = [ "scroll_documentation_up" "fallback" ];
            "<C-e>" = [ "hide" ];
            "<C-f>" = [ "scroll_documentation_down" "fallback" ];
            "<C-n>" = [ "select_next" "fallback" ];
            "<C-p>" = [ "select_prev" "fallback" ];
            "<C-space>" = [ "show" "show_documentation" "hide_documentation" ];
            "<C-y>" = [ "select_and_accept" ];
            "<cr>" = [ "select_and_accept" "fallback" ];
            "<Down>" = [ "select_next" "fallback" ];
            "<Up>" = [ "select_prev" "fallback" ];
            # "<S-Tab>" = [ "snippet_backward" "fallback" ];
            # "<Tab>" = [ "snippet_forward" "fallback" ];
          };
        };
      };
      # blink-ripgrep.enable = true;

      auto-save.enable = true;
      web-devicons.enable = true;
      nvim-autopairs.enable = true;
      snacks.enable = true;
      snacks.settings.notifier.enable = true;
      # snacks.settings.statuscolumn.enable = true;
      # snacks.settings.bigfile.enable = true;
      # snacks.settings.quickfile.enable = true;
      gitsigns.enable = true;
      fugitive.enable = true;

      noice.enable = true;
      noice.settings = {
        presets = {
          bottom_search = false; # use a classic bottom cmdline for search
          command_palette = true; # position the cmdline and popupmenu together
          long_message_to_split = true; # long messages will be sent to a split
          inc_rename = false; # enables an input dialog for inc-rename.nvim
          lsp_doc_border = true; # add a border to hover docs and signature help
        };

        views = {
          cmdline_popup = {
            position = { row = "12%"; col = "50%"; };
          };
          mini = {
            win_options = { winblend = 0; };
          };
          lsp = {
            hover.silent = true; # does not work!?
            override = {
              "cmp.entry.get_documentation" = false;
              "vim.lsp.util.convert_input_to_markdown_lines" = true;
              "vim.lsp.util.stylize_markdown" = true;
            };
          };
        };
      };


      dashboard.enable = true;
      dashboard.settings = {
        change_to_vcs_root = false;

        hide.statusline = false;
        hide.tabline = false;

        config = {
          header = [
            ""
            ""
            "███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗"
            "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║"
            "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║"
            "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║"
            "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║"
            "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝"
            ""
            ""
          ];
          center = [
            {
              desc = "New File";
              icon = " ";
              action = "new|only";
            }
            {
              desc = "Recent Files";
              icon = " ";
              action = "Telescope oldfiles";
            }
            {
              desc = "Find Files";
              icon = " ";
              action = "Telescope find_files";
            }
            {
              desc = "Exit";
              icon = "󰩈 ";
              action = "exit";
            }
          ];

          footer = [
            ""
            ""
            "Neovim is open source and freely distributable"
          ];
        };
        theme = "doom";
      };

      neo-tree.enable = true;
      neo-tree.window.width = 30;
      neo-tree.defaultComponentConfigs.diagnostics.symbols = {
        hint = "";
        info = "";
        warn = "";
        error = "";
      };

      which-key.enable = true;
      git-conflict.enable = true;
      telescope.enable = true;
      telescope.settings = {
        defaults = {
          layout_config = {
            prompt_position = "top";
            preview_width = 0.55;
          };
          prompt_prefix = "   ";
          selection_caret = " ";
          sorting_strategy = "ascending";
        };
      };

      nvim-surround.enable = true;

      lsp = {
        enable = true;
        servers = {
          nixd = {
            enable = true;
            settings.formatting.command = [ "nixpkgs-fmt" ];
            # settings.nixpkgs = nixpkgs;
          };

          bashls.enable = true;
          dockerls.enable = true;
          jsonls.enable = true;
          html.enable = true;
          cssls.enable = true;
          tailwindcss.enable = true;
          phpactor.enable = true;
          pyright.enable = true;
          vimls.enable = true;
          yamlls.enable = true;
        };
      };

      none-ls = {
        enable = true;
        sources = {
          formatting = {
            black.enable = true; # python
          };
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      camelcasemotion

      (pkgs.vimUtils.buildVimPlugin {
        pname = "llama.vim";
        version = "rti-dev";
        # src = inputs.minuet-ai;
        src = pkgs.fetchurl {
          url = "https://github.com/ggml-org/llama.vim/archive/163c87d169f4aaecc740c83902fe71bcffd9eda5.tar.gz";
          sha256 = "sha256-jaPcAg5LoOerKbuWNvQomi5VREHbL1BksWHg2max7bs=";
        };
      })
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
      vim.defer_fn(disable_llama_debug, 1000)
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
