{ ... }:

{
  plugins.noice = {
    enable = true;
    settings = {
      presets = {
        bottom_search = false; # use a classic bottom cmdline for search
        command_palette = true; # position the cmdline and popupmenu together
        long_message_to_split = true; # long messages will be sent to a split
        inc_rename = false; # enables an input dialog for inc-rename.nvim
        lsp_doc_border = true; # add a border to hover docs and signature help
      };

      views = {
        cmdline_popup = {
          position = { row = "12%"; col = "50%"; };
        };
        mini = {
          win_options = { winblend = 0; };
        };
        lsp = {
          hover.silent = true; # does not work!?
          override = {
            "cmp.entry.get_documentation" = false;
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
          };
        };
      };
    };
  };
}
