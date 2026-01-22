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
    tiny-inline-diagnostic = {
      enable = true;
      settings = {
        preset = "classic";
        multilines = true;
        virt_texts = { priority = 2048; };
      };
    };

    navic = {
      enable = true;
      settings.lsp.auto_attach = true;
    };

    lsp = {
      enable = true;
      servers = {
        nixd = {
          enable = true;
          settings.formatting.command = [ "nixpkgs-fmt" ];
          # settings.nixpkgs = nixpkgs;
        };

        rust_analyzer = {
          enable = true;
          installRustc = false; # take from project
          installCargo = false; # take from project
        };

        basedpyright = {
          enable = true;
          settings = {
            basedpyright.analysis.typeCheckingMode = "standard";
          };
        };

        bashls.enable = true;
        cssls.enable = true;
        dockerls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        phpactor.enable = true;
        tailwindcss.enable = true;
        terraform_lsp.enable = true;
        ts_ls.enable = true;
        vimls.enable = true;
        yamlls.enable = true;
      };
    };

    none-ls = {
      enable = true;
      sources = {
        formatting = {
          black.enable = true;

          prettier.enable = true; # lots of web related filetypes
          prettier.disableTsServerFormatter = true;

          opentofu_fmt.enable = true;
        };
        diagnostics = {
          opentofu_validate.enable = true;
        };
      };
    };
  };

  extraConfigLua = ''
    vim.diagnostic.config { 
      signs = { 
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.INFO] = '',
          [vim.diagnostic.severity.HINT] = '',
        }
      };
      virtual_text = false; -- handled by tiny-inline-diagnostic
      update_in_insert = true;
      underline = true;
      severity_sort = true;
    }
  '';

}
