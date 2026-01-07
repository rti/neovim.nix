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
        lualine_x = [
          # macro recording information
          {
            __unkeyed-1.__raw = ''
              function()
                return require('noice').api.statusline.mode.get():gsub('recording', 'rec')
              end
            '';
            cond.__raw = ''
              function()
                local noice = require("noice")
                if noice.api.statusline.mode.has() and noice.api.statusline.mode.get():find("^recording") then
                  return true
                else
                  return false
                end
              end
            '';
          }
        ];
        lualine_y = [ "filetype" "progress" ];
        lualine_z = [ "location" ];
      };

      inactive_sections = {
        lualine_x = [ "progress" ];
      };
    };
  };
}
