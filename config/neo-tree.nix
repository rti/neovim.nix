{ ... }:

{
  keymaps = [
    { mode = [ "n" "v" ]; key = "<localleader>n"; action = "<cmd>Neotree reveal toggle<cr><c-w>p"; }
    { mode = [ "n" "v" ]; key = "<localleader>b"; action = "<cmd>Neotree buffers toggle<cr><c-w>p"; }
  ];

  plugins.neo-tree = {
    enable = true;

    popupBorderStyle = "rounded";

    window = {
      autoExpandWidth = true;
      width = 30;
    };

    filesystem = {
      groupEmptyDirs = true;
      scanMode = "deep";
      followCurrentFile.enabled = true;
      followCurrentFile.leaveDirsOpen = true;
    };

    buffers = {
      followCurrentFile.enabled = true;
      followCurrentFile.leaveDirsOpen = true;
    };

    defaultComponentConfigs.diagnostics.symbols = {
      hint = "";
      info = "";
      warn = "";
      error = "";
    };

    window.mappings = {
      "g?" = "show_help";
    };
  };
}
