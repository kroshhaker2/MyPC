{ config, ... }:

let
  dotfiles = "/etc/nixos/dotfiles/rofi";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
in
{
  xdg.configFile."rofi/config.rasi".source = link "config.rasi";
  xdg.configFile."rofi/theme.rasi".source = link "theme.rasi";
}
