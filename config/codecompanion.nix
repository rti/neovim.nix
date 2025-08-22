{ pkgs, ... }:
{
  keymaps = [
    { mode = [ "n" "v" ]; key = "<localleader>cc"; action = "<cmd>CodeCompanionChat Toggle<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>ca"; action = "<cmd>CodeCompanionActions<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>ci"; action = "<cmd>CodeCompanion<cr>"; }
  ];

  plugins.codecompanion = {
    enable = true;

    package = (pkgs.vimUtils.buildVimPlugin {
      pname = "codecompanion-nvim";
      version = "2025-06-16";
      src = pkgs.fetchurl {
        url = "https://github.com/olimorris/codecompanion.nvim/archive/f0e5ec927081474465e9c08f42112c19995f94a9.tar.gz";
        sha256 = "sha256-3AVevUdwfy0F4V99KW853aam3xlC2reMt/ojIrKxVO0=";
      };
    });

    settings = {
      adapters = {
        gemini = "gemini";
        llamacpp = {
          __raw = ''
            function()
              return require("codecompanion.adapters").extend("openai_compatible", {
                env = {
                  url = "http://localhost:8080";
                  chat_url = "/v1/chat/completions";
                };
              })
            end
          '';
        };

        opts = {
          allow_insecure = false;
          show_defaults = false;
          proxy = null;
        };
      };

      strategies =
        let
          # default-adapter = "gemini";
          default-adapter = "llamacpp"; 
        in
        {
          agent = {
            adapter = default-adapter;
          };
          chat = {
            adapter = default-adapter;
          };
          inline = {
            adapter = default-adapter;
          };
        };

      display.chat.window.opts = {
        number = false;
        relativenumber = false;
        signcolumn = "yes:1";
      };

      opts = {
        # log_level = "TRACE";
        send_code = true;
        use_default_actions = true;
        use_default_prompts = true;
      };
    };
  };

  # ugly workaround for markdown not being completely rendered
  extraConfigLua = ''
    local function hook()
      local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})
      vim.api.nvim_create_autocmd({ "User" }, {
        pattern = "CodeCompanionRequestFinished",
        group = group,
        callback = function(request)
          vim.defer_fn(function()
            require('render-markdown.core.manager').set_buf(request.buf, true)
          end, 250)
        end,
      })
    end
    vim.defer_fn(hook, 1000)
  '';
}
