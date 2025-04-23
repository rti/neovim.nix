{ pkgs, ... }:

{
  keymaps = [
    # CamelCaseMotion
    { mode = [ "n" "v" "t" ]; key = ",w"; action = "<plug>CamelCaseMotion_w"; }
    { mode = [ "n" "v" "t" ]; key = ",b"; action = "<plug>CamelCaseMotion_b"; }
    { mode = [ "n" "v" "t" ]; key = ",e"; action = "<plug>CamelCaseMotion_e"; }
    { mode = [ "n" "v" "t" ]; key = ",ge"; action = "<plug>CamelCaseMotion_ge"; }
  ];

  extraPlugins = with pkgs.vimPlugins; [
    camelcasemotion
  ];
}
