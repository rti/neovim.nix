{ ... }:

{
  keymaps = [
    # LSP and LSP Format
    { mode = "n"; key = "<localleader>lf"; action = "<cmd>lua vim.lsp.buf.format({async=true})<cr>"; }
    { mode = "v"; key = "<localleader>lf"; action = "<cmd>lua vim.lsp.buf.range_formatting()<cr>"; }
    { mode = "n"; key = "<c-h>"; action = "<cmd>lua vim.lsp.buf.hover()<cr>"; }
    { mode = "n"; key = "<localleader>ln"; action = "<cmd>lua vim.lsp.buf.rename()<cr>"; }
    { mode = "n"; key = "<localleader>la"; action = "<cmd>lua vim.lsp.buf.code_action()<cr>"; }
  ];

  plugins = {
    lsp = {
      enable = true;
      servers = {
        vimls.enable = true;

        nixd = {
          enable = true;
          settings.formatting.command = [ "nixpkgs-fmt" ];
          # settings.nixpkgs = nixpkgs;
        };

        bashls.enable = true;

        dockerls.enable = true;

        html.enable = true;
        cssls.enable = true;
        tailwindcss.enable = true;

        phpactor.enable = true;
        pylsp.enable = true;


        jsonls.enable = true;
        yamlls.enable = true;
      };
    };

    none-ls = {
      enable = true;
      sources = {
        formatting = {
          black.enable = true; # python
          prettier.enable = true; # lots of web related filetypes
        };
      };
    };
  };

  extraConfigLua = ''
    for type, icon in pairs({ Hint = "", Info = "", Warn = "", Error = "", }) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  '';

}
