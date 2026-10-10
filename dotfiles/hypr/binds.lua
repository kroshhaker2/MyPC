local bind = hl.bind

-- Applications and session.
bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"))
bind("SUPER + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
bind("SUPER + E", hl.dsp.exec_cmd("nautilus --new-window"))
bind("SUPER + B", hl.dsp.exec_cmd("zen-beta"))
bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
bind("SUPER + ESCAPE", hl.dsp.exec_cmd("wlogout"))
bind("SUPER + SHIFT + ESCAPE", hl.dsp.exec_cmd("uwsm stop"))
bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Windows.
bind("SUPER + Q", hl.dsp.window.close())
bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))
bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
bind("SUPER + P", hl.dsp.window.pseudo({ action = "toggle" }))
bind("SUPER + T", hl.dsp.layout("togglesplit"))
bind("SUPER + TAB", hl.dsp.focus({ last = true }))
bind("ALT + TAB", hl.dsp.window.cycle_next())

for key, direction in pairs({ LEFT = "l", RIGHT = "r", UP = "u", DOWN = "d" }) do
  bind("SUPER + " .. key, hl.dsp.focus({ direction = direction }))
  bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ direction = direction }))
end

bind("SUPER + CTRL + LEFT", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })
bind("SUPER + CTRL + RIGHT", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })
bind("SUPER + CTRL + UP", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { repeating = true })
bind("SUPER + CTRL + DOWN", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { repeating = true })

bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
bind("SUPER + mouse:274", hl.dsp.window.float({ action = "toggle" }), { mouse = true })

-- Screenshots and desktop utilities.
bind("PRINT", hl.dsp.exec_cmd("grimblast --notify copysave area"))
bind("SHIFT + PRINT", hl.dsp.exec_cmd("grimblast --notify copysave screen"))
bind("SUPER + PRINT", hl.dsp.exec_cmd("grimblast --notify copysave output"))
bind("CTRL + PRINT", hl.dsp.exec_cmd("grimblast --notify copysave active"))
bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
bind("SUPER + SHIFT + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))
bind("SUPER + PERIOD", hl.dsp.exec_cmd("rofimoji --action copy"))
bind("SUPER + W", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))

-- Drop-down workspaces.
bind("SUPER + code:49", hl.dsp.workspace.toggle_special("terminal"))
bind("SUPER + O", hl.dsp.workspace.toggle_special("obsidian"))
bind("SUPER + S", hl.dsp.workspace.toggle_special("scratchpad"))
bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))
bind("SUPER + CTRL + S", function()
  local workspace = hl.get_active_workspace()
  if workspace then
    hl.dispatch(hl.dsp.window.move({ workspace = workspace, follow = true }))
  end
end)

-- Audio and brightness.
local repeatable = { locked = true, repeating = true }
bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), repeatable)
bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), repeatable)
bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), repeatable)
bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), repeatable)

bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Workspaces 1-10. Number 0 maps to workspace 10.
for key = 0, 9 do
  local workspace = key == 0 and 10 or key
  bind("SUPER + " .. key, hl.dsp.focus({ workspace = workspace }))
  bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace, follow = true }))
  bind("SUPER + CTRL + " .. key, hl.dsp.window.move({ workspace = workspace, follow = false }))
end
