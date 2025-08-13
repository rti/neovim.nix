{ ... }:

{
  plugins.render-markdown = {
    enable = true;
    settings = {
      file_types = [ "markdown" "codecompanion" ];
      heading = {
        sign = false;
        border = true;
      };
      bullet = {
        icons = [ "• " "• " ];
      };
      code = {
        above = " ";
        below = " ";
        border = "thick";
        language_pad = 2;
        left_pad = 2;
        right_pad = 2;
        sign = false;
        width = "block";
      };
      anti_conceal = {
        enabled = true;
        disabled_modes = [ "n" "c" "v" ];
      };

      # TODO: should be handled by nixvim
      completions.blink.enabled = true;
    };
  };
}
