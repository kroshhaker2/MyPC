{ config, ... }:

let
  dotfiles = "/etc/nixos/dotfiles/wlogout";
  link = name: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${name}";
in
{
  xdg.configFile = {
    "wlogout/layout".source = link "layout";
    "wlogout/style.css".source = link "style.css";
    "wlogout/lock.png".source = link "lock.png";
    "wlogout/logout.png".source = link "logout.png";
    "wlogout/pause.png".source = link "pause.png";
    "wlogout/power.png".source = link "power.png";
    "wlogout/restart.png".source = link "restart.png";
    "wlogout/sleep.png".source = link "sleep.png";
  };
}
