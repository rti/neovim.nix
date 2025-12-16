{ ... }:

{
  keymaps = [
    { mode = [ "n" "v" ]; key = "<localleader>n"; action = "<cmd>Neotree reveal toggle<cr><c-w>p<c-w>="; }
    { mode = [ "n" "v" ]; key = "<localleader>b"; action = "<cmd>Neotree buffers toggle<cr><c-w>p<c-w>="; }
  ];

  plugins.neo-tree = {
    enable = true;

    settings = {
      popupBorderStyle = "rounded";

      window = {
        autoExpandWidth = false;
        width = 32;

        mappings = {
          "g?" = "show_help";
          "/" = "noop";
          "?" = "noop";
          "q" = "noop";
        };
      };

      filesystem = {
        groupEmptyDirs = true;
        scanMode = "deep";
        useLibuvFileWatcher = true;
        followCurrentFile.enabled = true;
        followCurrentFile.leaveDirsOpen = true;
        filteredItems = {
          hideDotfiles = false;
          hideGitignored = true;
          neverShow = [
            ".DS_Store"
            "thumbs.db"
            ".git"
          ];
        };

      };

      buffers = {
        followCurrentFile.enabled = true;
        followCurrentFile.leaveDirsOpen = true;
      };

      defaultComponentConfigs.indent.withExpanders = true;

      defaultComponentConfigs.diagnostics.symbols = {
        hint = "";
        info = "";
        warn = "";
        error = "";
      };
    };
  };
}
