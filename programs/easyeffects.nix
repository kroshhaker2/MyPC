{
  config,
  lib,
  pkgs,
  ...
}:

let
  lv2Plugins = with pkgs; [
    lsp-plugins
    calf
    zam-plugins
    mda_lv2
  ];

  ladspaPlugins = with pkgs; [
    lsp-plugins
    calf
    zam-plugins
  ];

  easyeffects = pkgs.easyeffects.overrideAttrs (old: {
    preFixup = (old.preFixup or "") + ''
      gappsWrapperArgs+=(
        --set LV2_PATH "${lib.makeSearchPath "lib/lv2" lv2Plugins}"
        --set LADSPA_PATH "${lib.makeSearchPath "lib/ladspa" ladspaPlugins}"
      )
    '';
  });
in
{
  environment.systemPackages = [
    easyeffects
  ];
}
