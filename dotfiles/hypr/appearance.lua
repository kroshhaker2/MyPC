local colors = dofile("/etc/nixos/dotfiles/theme/colors.lua")

hl.config({
  animations = {
    enabled = true,
  },
})

hl.curve("fluid", {
  type = "bezier",
  points = {
    { 0.15, 0.85 },
    { 0.25, 1.0 },
  },
})

hl.curve("snappy", {
  type = "bezier",
  points = {
    { 0.3, 1.0 },
    { 0.4, 1.0 },
  },
})

hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 3,
  bezier = "fluid",
  style = "popin 5%",
})

hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 2.5,
  bezier = "snappy",
})

hl.animation({
  leaf = "fade",
  enabled = true,
  speed = 4,
  bezier = "snappy",
})

hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 1.7,
  bezier = "snappy",
  style = "slide",
})

hl.animation({
  leaf = "specialWorkspace",
  enabled = true,
  speed = 4,
  bezier = "fluid",
  style = "slidefadevert -35%",
})

hl.animation({
  leaf = "layers",
  enabled = true,
  speed = 2,
  bezier = "snappy",
  style = "popin 70%",
})

hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 10,
    border_size = 1,
    ["col.active_border"] = "rgba(" .. colors.color1 .. "ff)",
    ["col.inactive_border"] = "rgba(" .. colors.color2 .. "66)",
    resize_on_border = true,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding = 10,
    rounding_power = 2,

    active_opacity = 0.94,
    inactive_opacity = 0.88,
    fullscreen_opacity = 1.0,

    blur = {
      enabled = true,
      size = 3,
      passes = 2,
      new_optimizations = true,
      ignore_opacity = true,
      xray = false,
      popups = true,
    },

    shadow = {
      enabled = true,
      range = 15,
      render_power = 4,
      color = "rgba(" .. colors.color0 .. "80)",
    },
  },

  dwindle = {
    preserve_split = true,
  },

  misc = {
    force_default_wallpaper = -1,
    disable_hyprland_logo = true,
    focus_on_activate = true,
  },

  animations = {
    enabled = true
  }
})
