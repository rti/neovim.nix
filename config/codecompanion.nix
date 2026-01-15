{ pkgs, ... }:
{
  keymaps = [
    { mode = [ "n" "v" ]; key = "<localleader>cl"; action = "<cmd>CodeCompanionChat adapter=llamacpp<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>cg"; action = "<cmd>CodeCompanionChat adapter=gemini_cli<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>ct"; action = "<cmd>CodeCompanionChat Toggle<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>ca"; action = "<cmd>CodeCompanionActions<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>ci"; action = "<cmd>CodeCompanion<cr>"; }
  ];

  plugins.codecompanion = {
    enable = true;

    # package = (pkgs.vimUtils.buildVimPlugin {
    #   pname = "codecompanion-nvim";
    #   version = "2025-06-16";
    #   src = pkgs.fetchurl {
    #     url = "https://github.com/olimorris/codecompanion.nvim/archive/f0e5ec927081474465e9c08f42112c19995f94a9.tar.gz";
    #     sha256 = "sha256-3AVevUdwfy0F4V99KW853aam3xlC2reMt/ojIrKxVO0=";
    #   };
    # });

    settings = {
      interactions = {
        chat = {
          adapter = "llamacpp";
          keymaps = {
            options.modes = {
              n = "g?";
            };
            send.modes = {
              n = [ "<CR>" "<C-s>" "<S-CR>" "<C-CR>" ];
              i = [ "<C-s>" "<S-CR>" "<C-CR>" ];
            };
          };
        };
        inline = {
          adapter = "llamacpp";
        };
        cmd = {
          adapter = "llamacpp";
        };
      };

      adapters = {
        acp = {
          gemini_cli = {
            __raw = /*lua*/ ''
              function()
                return require("codecompanion.adapters").extend("gemini_cli", {
                  defaults = {
                    auth_method = "vertex-ai",
                  },
                })
              end
            '';
          };

          opts.show_presets = false;
        };

        http = {
          llamacpp = {
            __raw = ''
              function()
                return require("codecompanion.adapters").extend("openai_compatible", {
                  name = "llamacpp",
                  formatted_name = "llama.cpp",
                  env = {
                    -- url = "http://localhost:8080";
                    url = "http://localhost:8013"; -- llama-server --gpt-oss-20b-default
                    chat_url = "/v1/chat/completions";
                  };
                })
              end
            '';
          };

          opts.show_presets = false;
        };

      };

      display.chat = {
        intro_message = "Welcome to CodeCompanion";
        show_settings = true;
        start_in_insert_mode = false;

        window = {
          width = 104;
          layout = "vertical";

          opts = {
            number = false;
            relativenumber = false;
            signcolumn = "yes:1";
            breakindent = true;
            linebreak = true;
            wrap = true;
          };
        };
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

  extraPackages = with pkgs; [ gemini-cli ];
}
