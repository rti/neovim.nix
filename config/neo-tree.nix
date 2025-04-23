{ ... }:

{
  keymaps = [
    # Neotree
    { mode = [ "n" "v" "t" ]; key = "<localleader>n"; action = "<cmd>Neotree reveal toggle<cr>"; }
    { mode = [ "n" "v" "t" ]; key = "<localleader>b"; action = "<cmd>Neotree buffers toggle<cr>"; }
  ];

  plugins.neo-tree = {
    enable = true;
    window.width = 30;
    filesystem.groupEmptyDirs = true;
    filesystem.scanMode = "deep";
    defaultComponentConfigs.diagnostics.symbols = {
      hint = "";
      info = "";
      warn = "";
      error = "";
    };
  };
}
