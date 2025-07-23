{ ... }:

{
  plugins.render-markdown = {
    enable = true;
    settings = {
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
    };
  };
}
