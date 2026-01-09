{
  extraConfigLua = ''
    function _G.toggle_wrap()
      vim.opt.wrap = not vim.opt.wrap:get()
    end
  '';

  keymaps = [
    {
      mode = [ "n" "v" ];
      key = "<localleader>w";
      action = "<cmd>lua _G.toggle_wrap()<CR>";
    }
  ];
}
