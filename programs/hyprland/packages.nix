{ ... }:

{
  # Prefer native Wayland for Electron/Chromium applications. This keeps them
  # sharp on fractionally scaled monitors instead of stretching XWayland.
  xdg.configFile."uwsm/env".text = ''
    export NIXOS_OZONE_WL=1
    export ELECTRON_OZONE_PLATFORM_HINT=auto
    export CODEX_OZONE_PLATFORM=wayland
  '';
}
