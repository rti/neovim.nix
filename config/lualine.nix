{ lib, ... }:

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

      tabline = {
        lualine_a = [ "tabs" ];
      };

      sections = {
        lualine_b = [
          {
            __unkeyed-1 = "filename";
            path = 1; # https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#filename-component-options
          }
        ];
        lualine_c = [ "navic" ];
        lualine_x = [ "filetype" ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };

      inactive_sections = {
        lualine_x = [ "progress" ];
      };
    };
  };
}
