{ ... }:

{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      cmdline = {
        keymap = {
          "<C-space>" = [ "show" ];
          "<C-y>" = [ "select_and_accept" ];
          "<cr>" = [ "accept" "fallback" ];
          "<C-e>" = [ "cancel" "show" ];
          "<C-c>" = [ "cancel" ];
          "<C-n>" = [ "show_and_insert" "select_next" "fallback" ];
          "<C-p>" = [ "select_prev" "fallback" ];
          "<Down>" = [ "select_next" "fallback" ];
          "<Up>" = [ "select_prev" "fallback" ];
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
        "<C-b>" = [ "scroll_documentation_up" "fallback" ];
        "<C-e>" = [ "cancel" "show" ];
        "<C-c>" = [ "cancel" ];
        "<C-f>" = [ "scroll_documentation_down" "fallback" ];
        "<C-n>" = [ "show_and_insert" "select_next" "fallback" ];
        "<C-p>" = [ "select_prev" "fallback" ];
        "<C-space>" = [ "show" "show_documentation" "hide_documentation" ];
        "<C-y>" = [ "select_and_accept" ];
        "<cr>" = [ "accept" "fallback" ];
        "<Down>" = [ "select_next" "fallback" ];
        "<Up>" = [ "select_prev" "fallback" ];
        # "<S-Tab>" = [ "snippet_backward" "fallback" ];
        # "<Tab>" = [ "snippet_forward" "fallback" ];
      };
    };
  };
}
