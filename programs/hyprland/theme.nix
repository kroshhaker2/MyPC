{ config, ... }:

let
  theme = "/etc/nixos/dotfiles/theme";
  link = name: config.lib.file.mkOutOfStoreSymlink "${theme}/${name}";
in
{
  xdg.configFile = {
    "waybar/colors.css".source = link "colors-waybar.css";
    "wlogout/colors.css".source = link "colors-waybar.css";
    "rofi/colors.rasi".source = link "colors-rofi.rasi";
  };
}
