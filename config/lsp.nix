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

          # jedi is on by default, still, make it explicit here
          settings.plugins.jedi_completion.enabled = true;
          settings.plugins.jedi_definition.enabled = true;
          settings.plugins.jedi_hover.enabled = true;
          settings.plugins.jedi_references.enabled = true;
          settings.plugins.jedi_signature_help.enabled = true;
          settings.plugins.jedi_symbols.enabled = true;

          # https://nix-community.github.io/nixvim/search/?query=pylsp*enabled
          # https://inventwithpython.com/blog/2022/11/19/python-linter-comparison-2022-pylint-vs-pyflakes-vs-flake8-vs-autopep8-vs-bandit-vs-prospector-vs-pylama-vs-pyroma-vs-black-vs-mypy-vs-radon-vs-mccabe/
          settings.plugins.rope.enabled = true; # refactoring code actions
          settings.plugins.pyflakes.enabled = true; # linter for warnings and errors
          settings.plugins.pylsp_mypy.enabled = true; # type checker, slow
          settings.plugins.black.enabled = true; # formatting

          # all in one linter and code formatter
          # does not support warnings in may 2025
          #settings.plugins.ruff.enabled = true; 
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
