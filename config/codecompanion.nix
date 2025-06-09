{ ... }:
{
  keymaps = [
    { mode = [ "n" "v" ]; key = "<localleader>cc"; action = "<cmd>CodeCompanionChat Toggle<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>ca"; action = "<cmd>CodeCompanionActions<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>ci"; action = "<cmd>CodeCompanion<cr>"; }
  ];

  plugins.codecompanion = {
    enable = true;
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

      strategies = {
        agent = {
          adapter = "llamacpp";
          # adapter = "gemini";
        };
        chat = {
          adapter = "llamacpp";
          # adapter = "gemini";
        };
        inline = {
          adapter = "llamacpp";
          # adapter = "gemini";
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
}
