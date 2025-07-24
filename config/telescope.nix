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
        mappings = {
          n = {
            "<C-N>".__raw = "require('telescope.actions').cycle_history_next";
            "<C-P>".__raw = "require('telescope.actions').cycle_history_prev";
          };
          i = {
            "<C-N>".__raw = "require('telescope.actions').cycle_history_next";
            "<C-P>".__raw = "require('telescope.actions').cycle_history_prev";
          };
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

    extensions.ui-select.enable = true;
    extensions.fzf-native.enable = true;
  };

  extraPackages = with pkgs; [ ripgrep ];
}
