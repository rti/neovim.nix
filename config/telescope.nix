{ pkgs, lib, ... }:

{
  keymaps = [
    { mode = [ "n" "v" ]; key = "<localleader>ff"; action = "<cmd>Telescope find_files<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>fg"; action = ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>fb"; action = "<cmd>Telescope oldfiles<cr>"; }
  ];

  # TODO: https://nix-community.github.io/nixvim/search/?option_scope=0&option=plugins.telescope.extensions.live-grep-args.enable&query=telescope*arg

  plugins.telescope = {
    enable = true;
    settings = {
      pickers = {
        find_files = {
          find_command = [
            (lib.getExe pkgs.fd)
            "--type"
            "f"
            "--hidden"
            "--strip-cwd-prefix"
            "--exclude"
            ".git"
          ];
        };
      };
      defaults = {
        layout_strategy = "vertical";
        layout_config = {
          height = 0.95; # full telescope height
          prompt_position = "top";
          mirror = true;
          preview_height = 0.75;
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
        vimgrep_arguments = [
          (lib.getExe pkgs.ripgrep)
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
          "--hidden"
          "--glob"
          "!**/.git/*"
        ];
      };
    };

    extensions.ui-select.enable = true;
    extensions.fzf-native.enable = true;

    extensions.live-grep-args = {
      enable = true;
      settings.mappings = {
        i = {
          "<C-i>" = {
            __raw = "require(\"telescope-live-grep-args.actions\").quote_prompt({ postfix = \" --iglob */*\" })";
          };
          "<C-k>" = {
            __raw = "require(\"telescope-live-grep-args.actions\").quote_prompt()";
          };
          "<C-y>" = {
            __raw = "require(\"telescope.actions\").to_fuzzy_refine";
          };
        };
      };
    };
  };

  extraPackages = with pkgs; [ ripgrep ];
}
