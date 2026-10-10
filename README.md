# Конфигурация NixOS

## Система

```bash
nrs # собрать и применить
nrt # применить до перезагрузки
nrb # применить при следующей загрузке
nrg # только собрать
```

## Конфиги рабочего стола

Hyprland, Waybar и Rofi находятся в `dotfiles/` и подключены напрямую. Для большинства правок `nrs` не нужен.

```bash
hyprctl reload                         # перечитать Hyprland
systemctl --user restart waybar        # перезапустить Waybar
rofi -show drun                        # Rofi читает конфиг при запуске
```

## Форматирование и проверки

```bash
treefmt                                # форматировать весь репозиторий
prettier --write dotfiles/waybar       # форматировать Waybar
stylua dotfiles/hypr                   # форматировать Hyprland Lua
nixfmt path/to/file.nix                # форматировать один Nix-файл
statix check .                         # проверить Nix-код
deadnix .                              # найти неиспользуемый Nix-код
nix flake check                        # проверить flake
```
