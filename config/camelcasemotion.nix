{ pkgs, ... }:

{
  keymaps = [
    # CamelCaseMotion
    { mode = [ "n" "v" ]; key = ",w"; action = "<plug>CamelCaseMotion_w"; }
    { mode = [ "n" "v" ]; key = ",b"; action = "<plug>CamelCaseMotion_b"; }
    { mode = [ "n" "v" ]; key = ",e"; action = "<plug>CamelCaseMotion_e"; }
    { mode = [ "n" "v" ]; key = ",ge"; action = "<plug>CamelCaseMotion_ge"; }
  ];

  extraPlugins = with pkgs.vimPlugins; [
    camelcasemotion
  ];
}
