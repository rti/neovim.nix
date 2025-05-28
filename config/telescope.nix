{ pkgs, lib, ... }:

{
  keymaps = [
    { mode = [ "n" "v" ]; key = "<localleader>ff"; action = "<cmd>Telescope find_files<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>fg"; action = "<cmd>Telescope live_grep<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>fb"; action = "<cmd>Telescope oldfiles<cr>"; }
  ];

  # TODO: https://nix-community.github.io/nixvim/search/?option_scope=0&option=plugins.telescope.extensions.live-grep-args.enable&query=telescope*arg

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
        vimgrep_arguments =
          let
            customRipgrepArgs = [
              "--hidden"
              "--glob"
              "!**/.git/*"
            ];
          in
          [
            (lib.getExe pkgs.ripgrep)
            "--color=never"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
            "--smart-case"
          ] ++ customRipgrepArgs;
      };
    };
  };

  extraPackages = with pkgs; [ ripgrep ];
}
