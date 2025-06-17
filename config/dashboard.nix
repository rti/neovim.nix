{ ... }:

{
  plugins.dashboard = {
    enable = true;
    settings = {
      change_to_vcs_root = false;

      hide.statusline = false;
      hide.tabline = false;

      theme = "doom";

      config = {
        header = [
          ""
          ""
          "███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗"
          "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║"
          "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║"
          "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║"
          "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║"
          "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝"
          ""
          ""
        ];
        center = [
          { desc = "Find Files"; icon = " "; action = "Telescope find_files"; }
          { desc = "Recent Files"; icon = " "; action = "Telescope oldfiles"; }
          { desc = "New File"; icon = " "; action = "new|only"; }
          { desc = "Exit"; icon = "󰩈 "; action = "exit"; }
        ];

        footer = [
          ""
          ""
          "Neovim is open source and freely distributable"
        ];
      };
    };
  };
}
