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
  size = { "monitor_w*0.90", "monitor_h*0.45" },
  move = { "monitor_w*0.05", "40" },
  rounding = 10,
})
