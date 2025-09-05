{ ... }:

{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "rti";
        # disabled_filetypes = [ "neo-tree" "fugitive" ];
        disabled_filetypes = [ "neo-tree" ];
        component_separators = { left = ""; right = ""; };
        section_separators = { left = ""; right = ""; };
        always_show_tabline = false;
      };
      tabline = { lualine_a = [ "tabs" ]; };
      sections = { lualine_x = [ "navic" ]; };
    };
  };
}
