{ config, ... }:

let
  dotfiles = "/etc/nixos/dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
in
{
  imports = [
    ./appearance.nix
    ./autostart.nix
    ./packages.nix
    ./rofi.nix
    ./theme.nix
    ./waybar.nix
    ./wlogout.nix
  ];

  xdg.configFile = {
    "hypr/hyprland.lua".source = link "hypr/hyprland.lua";
    "hypr/appearance.lua".source = link "hypr/appearance.lua";
    "hypr/binds.lua".source = link "hypr/binds.lua";
    "hypr/input.lua".source = link "hypr/input.lua";
    "hypr/monitors.lua".source = link "hypr/monitors.lua";
    "hypr/rules.lua".source = link "hypr/rules.lua";
  };
}
