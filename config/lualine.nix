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
        lualine_x = [{ __unkeyed-1 = null; }];
        lualine_y = [ "filetype" ];
        lualine_z = [ "progress" ];
      };
    };
  };
}
