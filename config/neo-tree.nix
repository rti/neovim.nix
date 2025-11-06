{ ... }:

{
  keymaps = [
    { mode = [ "n" "v" ]; key = "<localleader>n"; action = "<cmd>Neotree reveal toggle<cr><c-w>p<c-w>="; }
    { mode = [ "n" "v" ]; key = "<localleader>b"; action = "<cmd>Neotree buffers toggle<cr><c-w>p<c-w>="; }
  ];

  plugins.neo-tree = {
    enable = true;

    popupBorderStyle = "rounded";

    window = {
      autoExpandWidth = false;
      width = 32;
    };

    filesystem = {
      groupEmptyDirs = true;
      scanMode = "deep";
      useLibuvFileWatcher = true;
      followCurrentFile.enabled = true;
      followCurrentFile.leaveDirsOpen = true;
      filteredItems.hideDotfiles = false;
      filteredItems.hideGitignored = true;
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

    window.mappings = {
      "g?" = "show_help";
      "/" = "noop";
      "?" = "noop";
      "q" = "noop";
    };
  };
}
