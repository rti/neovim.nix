{ pkgs, ... }:

{
  plugins.blink-ripgrep.enable = true;
  extraPackages = with pkgs; [ ripgrep ];

  plugins.blink-cmp = {
    enable = true;
    settings = {
      signature = { enabled = false; }; # handled by noice by default

      sources = {
        providers.ripgrep = {
          module = "blink-ripgrep";
          name = "ripgrep";
        };

        default = [ "lsp" "ripgrep" "snippets" "path" ];
      };

      completion = {
        list.selection = {
          preselect = false;
          auto_insert = true;
        };
        menu = {
          auto_show = true;
          border = "rounded";
        };
        documentation = {
          window.border = "rounded";
          auto_show = true;
          auto_show_delay_ms = 0;
        };
      };

      keymap = {
        "<C-space>" = [ "show" "show_documentation" "hide_documentation" ];
        "<C-y>" = [ "select_and_accept" ];
        "<cr>" = [ "accept" "fallback" ];

        "<C-n>" = [ "show_and_insert" "select_next" "fallback" ];
        "<C-p>" = [ "select_prev" "fallback" ];
        "<Down>" = [ "select_next" "fallback" ];
        "<Up>" = [ "select_prev" "fallback" ];

        "<C-e>" = [ "cancel" "show" ];
        "<C-c>" = [ "cancel" ];

        "<C-b>" = [ "scroll_documentation_up" "fallback" ];
        "<C-f>" = [ "scroll_documentation_down" "fallback" ];

        # "<S-Tab>" = [ "snippet_backward" "fallback" ];
        # "<Tab>" = [ "snippet_forward" "fallback" ];
      };

      cmdline = {
        keymap = {
          "<C-space>" = [ "show" ];
          "<C-y>" = [ "select_and_accept" ];
          "<cr>" = [ "accept" "fallback" ];

          "<C-n>" = [ "show_and_insert" "select_next" "fallback" ];
          "<C-p>" = [ "select_prev" "fallback" ];
          "<Down>" = [ "select_next" "fallback" ];
          "<Up>" = [ "select_prev" "fallback" ];

          "<C-e>" = [ "cancel" "show" ];
          "<C-c>" = [ "cancel" ];

          # "<Tab>" = [ "show" "accept" ];
        };
        completion = {
          list.selection = {
            preselect = false;
            auto_insert = true;
          };
          menu = {
            auto_show = {
              __raw = "function(ctx) return vim.fn.getcmdtype() == ':' end";
            };
          };
          ghost_text = { enabled = false; };
        };
      };
    };
  };
}
