hl.workspace_rule({
  workspace = "special:terminal",
  on_created_empty = "kitty --class dropdown-terminal",
})

hl.workspace_rule({
  workspace = "special:obsidian",
  on_created_empty = "obsidian",
})

hl.workspace_rule({ workspace = "special:scratchpad" })

hl.window_rule({
  name = "dropdown-terminal",
  match = { class = "dropdown-terminal" },
  float = true,
  workspace = "special:terminal silent",
  rounding = 10,
})

hl.layer_rule({
  name = "waybar-blur",
  match = { namespace = "waybar" },
  blur = true,
  ignore_alpha = 0.5,
})

hl.layer_rule({
  name = "rofi-blur",
  match = { namespace = "rofi" },
  blur = true,
  ignore_alpha = 0.5,
})
