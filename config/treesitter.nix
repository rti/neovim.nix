{ ... }:

{
  plugins = {
    treesitter = {
      enable = true;
      settings.highlight.enable = true;
      settings.indent.enable = true;
    };

    ts-context-commentstring.enable = true;
  };
}
