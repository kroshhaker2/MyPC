{ config, ... }:

let
  dotfiles = "/etc/nixos/dotfiles/waybar";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  xdg.configFile."waybar/config.jsonc".source = link "config.jsonc";
  xdg.configFile."waybar/style.css".source = link "style.css";
}
