{ ... }:

{
  keymaps = [
    { mode = [ "n" "v" ]; key = "<localleader>n"; action = "<cmd>Neotree reveal toggle<cr><c-w>p<c-w>="; }
    { mode = [ "n" "v" ]; key = "<localleader>b"; action = "<cmd>Neotree buffers toggle<cr><c-w>p<c-w>="; }
  ];

  plugins.neo-tree = {
    enable = true;

    settings = {
      popup_border_style = "rounded";

      default_component_configs = {
        indent = {
          with_expanders = true;
          expander_collapsed = "";
          expander_expanded = "";
          expander_highlight = "NeoTreeExpander";
        };
        diagnostics = {
          symbols = {
            hint = "";
            info = "";
            warn = "";
            error = "";
          };
        };
      };

      window = {
        width = 32;

        mappings = {
          "g?" = "show_help";
          "/" = "noop";
          "?" = "noop";
          "q" = "noop";
        };
      };

      filesystem = {
        group_empty_dirs = true;
        scan_mode = "deep";
        use_libuv_file_watcher = true;
        follow_current_file.enabled = true;
        follow_current_file.leave_dirs_open = true;

        filtered_items = {
          hide_dotfiles = false;
          hide_ignored = true;
          never_show = [ ".DS_Store" "thumbs.db" ".git" ];
        };
      };

      buffers = {
        follow_current_file.enabled = true;
        follow_current_file.leave_dirs_open = true;
      };
    };
  };
}
