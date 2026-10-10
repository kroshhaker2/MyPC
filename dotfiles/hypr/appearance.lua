hl.curve("dropdown", {
  type = "bezier",
  points = {
    { 0.22, 1.0 },
    { 0.36, 1.0 },
  },
})

hl.animation({
  leaf = "specialWorkspaceIn",
  enabled = true,
  speed = 4,
  bezier = "dropdown",
  style = "slidevert 100%",
})

hl.animation({
  leaf = "specialWorkspaceOut",
  enabled = true,
  speed = 4,
  bezier = "dropdown",
  style = "slidevert 100%",
})
