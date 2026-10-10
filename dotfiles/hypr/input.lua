hl.config({
  input = {
    kb_layout = "us,ru", -- ru-lat fi
    kb_options = "grp:alt_shift_toggle",

    touchpad = {
      disable_while_typing = true,
      natural_scroll = true,
      scroll_factor = 0.8,

      tap_to_click = true,
      tap_and_drag = true,
      drag_lock = 1,

      clickfinger_behavior = true,
      tap_button_map = "lrm",
    },
  },

  gestures = {
    workspace_swipe_distance = 300,
    workspace_swipe_cancel_ratio = 0.5,
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})
