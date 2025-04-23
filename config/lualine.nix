{ ... }:

{
  plugins.lualine = {
    enable = true;
    settings.options = {
      theme = "rti";
      disabled_filetypes = [ "neo-tree" "fugitive" ];
      component_separators = { left = ""; right = ""; };
      section_separators = { left = ""; right = ""; };
    };
  };
}
