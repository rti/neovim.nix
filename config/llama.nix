{ pkgs, ... }:

{
  extraPlugins = with pkgs.vimPlugins; [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "llama.vim";
      version = "dev";
      src = pkgs.fetchurl {
        url = "https://github.com/ggml-org/llama.vim/archive/163c87d169f4aaecc740c83902fe71bcffd9eda5.tar.gz";
        sha256 = "sha256-jaPcAg5LoOerKbuWNvQomi5VREHbL1BksWHg2max7bs=";
      };
    })
  ];

  extraConfigLua = ''
    local function disable_llama_debug()
      vim.cmd([[let g:llama_config.show_info = v:false]])
    end
    vim.defer_fn(disable_llama_debug, 1000)
  '';
}
