{ ... }:

{
  plugins.colorizer = {
    enable = true;
    settings =
      {
        user_default_options = {
          mode = "virtualtext";
          virtualtext = "■ ";

          RGB = false;
          names = false;
          AARRGGBB = false;

          RRGGBB = true;
          RRGGBBAA = true;
        };

        filetypes = {
          __unkeyed-1 = "*";
          __unkeyed-2 = "!vim";
          css = {
            css = true;
            css_fn = true;
          };
        };
        user_commands = [
          "ColorizerToggle"
          "ColorizerReloadAllBuffers"
        ];
      };
  };
}
