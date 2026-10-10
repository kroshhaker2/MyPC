-- Main Hyprland config. The individual sections live next to this file.
local config_dir = "/etc/nixos/dotfiles/hypr"

dofile(config_dir .. "/appearance.lua")
dofile(config_dir .. "/input.lua")
dofile(config_dir .. "/monitors.lua")
dofile(config_dir .. "/rules.lua")
dofile(config_dir .. "/binds.lua")
