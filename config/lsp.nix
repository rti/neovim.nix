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
        nixd = {
          enable = true;
          settings.formatting.command = [ "nixpkgs-fmt" ];
          # settings.nixpkgs = nixpkgs;
        };

        pylsp = {
          enable = true;
          settings.plugins.jedi_completion.enabled = true;
          settings.plugins.jedi_definition.enabled = true;
          settings.plugins.jedi_hover.enabled = true;
          settings.plugins.jedi_references.enabled = true;
          settings.plugins.jedi_signature_help.enabled = true;
          settings.plugins.jedi_symbols.enabled = true;
          settings.plugins.ruff.enabled = true; # linter and code formatter
        };

        bashls.enable = true;
        cssls.enable = true;
        dockerls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        phpactor.enable = true;
        tailwindcss.enable = true;
        vimls.enable = true;
        yamlls.enable = true;
      };
    };

    none-ls = {
      enable = true;
      sources = {
        formatting = {
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
