{ pkgs, ... }:

{
  plugins = {
    treesitter = {
      enable = true;
      settings.highlight.enable = true;
      settings.indent.enable = true;
    };

    ts-context-commentstring.enable = true;
    ts-autotag.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    nvim-treesitter-endwise
  ];
}
