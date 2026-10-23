{ ... }:

{
  keymaps = [
    { mode = [ "n" "v" ]; key = "<localleader>pp"; action = "<cmd>NoiceAll<cr><cmd>normal G<cr>"; }
  ];

  plugins.noice = {
    enable = true;

    settings = {
      presets = {
        bottom_search = false; # use a classic bottom cmdline for search
        command_palette = true; # position the cmdline and popupmenu together
        long_message_to_split = true; # long messages will be sent to a split
        inc_rename = false; # enables an input dialog for inc-rename.nvim
        lsp_doc_border = true; # add a border to hover docs and signature help
      };

      notify = {
        enabled = true;
        view = "mini";
      };

      messages = {
        view = "mini";
        view_error = "mini";
        view_warn = "mini";
      };

      views = {
        popup.backend = "popup_backdrop";
        confirm.backend = "popup_backdrop";
        cmdline_popup = {
          backend = "popup_backdrop";
          position = { row = "12%"; col = "50%"; };
        };
        mini = {
          timeout = 8000; # milliseconds
          # size = { width = "60%"; };
          win_options = {
            wrap = true;
            linebreak = true;
            breakindent = true;
            winblend = 0;
          };
        };
      };

      lsp = {
        hover.silent = true; # does not work!?
        override = {
          "cmp.entry.get_documentation" = false;
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
        };
      };

      routes = [
        # Prevent search virtual text messages
        {
          filter = {
            event = "msg_show";
            kind = "search_count";
          };
          opts = { skip = true; };
        }
      ];
    };
  };

  extraConfigLua = ''
    -- Noice's NUI popup backend has no backdrop option.
    package.preload["noice.view.backend.popup_backdrop"] = function()
      local Popup = require("noice.view.nui"):extend("PopupBackdrop")

      function Popup:init(opts)
        opts.type = "popup"
        Popup.super.init(self, opts)
      end

      function Popup:mount()
        Popup.super.mount(self)
        local parent = self._nui.winid
        local config = vim.api.nvim_win_get_config(parent)
        vim.api.nvim_set_hl(0, "NoiceBackdrop", { bg = "#ffffff" })
        local backdrop = Snacks.win({
          relative = "editor",
          width = 0,
          height = 0,
          row = 0,
          col = 0,
          border = "none",
          backdrop = false,
          focusable = false,
          zindex = config.zindex - 1,
          wo = {
            winhighlight = "Normal:NoiceBackdrop",
            winblend = 30,
          },
        })
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(parent),
          once = true,
          callback = function()
            backdrop:close()
          end,
        })
      end

      return Popup
    end
  '';
}
