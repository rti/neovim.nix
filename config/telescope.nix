{ pkgs,... }:

{
  keymaps = [
    # Telescope
    { mode = [ "n" "v" ]; key = "<localleader>ff"; action = "<cmd>Telescope find_files<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>fg"; action = "<cmd>Telescope live_grep<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>fb"; action = "<cmd>Telescope oldfiles<cr>"; }
  ];

  plugins.telescope = {
    enable = true;
    settings = {
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
  };

  extraPackages = with pkgs; [ ripgrep ];
}
