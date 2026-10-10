{ config, pkgs, ... }:

{
  home.username = "krosh";
  home.homeDirectory = "/home/krosh";

  home.stateVersion = "26.11";

  home.packages = with pkgs; [
    ayugram-desktop
    discord
    prismlauncher
    nautilus
    nerd-fonts.hack
    ripgrep
    fd
    eza
    bat
    btop
    nixfmt
    nixd
    prettier
    stylua
    shfmt
    shellcheck
    taplo
    treefmt
    statix
    deadnix
    vscode-langservers-extracted
    lua-language-server
    imv
    mpv
    jetbrains.idea
    spotify
    obsidian
    jdk8
    libreoffice
    spotifyd
    qbittorrent
    rofi
    hyprlock
    wlogout
    grimblast
    swaynotificationcenter
    cliphist
    wl-clipboard
    rofimoji
    waybar
    brightnessctl
    playerctl
    hyprpaper
    spotify-qt
    codex
  ];

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../programs/vscodium.nix
    ../programs/fish.nix
    ../programs/starship.nix
    ../programs/neovim.nix
    ../programs/direnv.nix
    ../programs/kitty.nix
    ../programs/git.nix
    ../programs/hyprland
  ];

  programs.codexDesktopLinux = {
    enable = true;
  };

  services.network-manager-applet.enable = true;

  services.spotifyd = {
    enable = true;
    settings.global = {
      backend = "pulseaudio";
      device_name = "NixOS";
      bitrate = 320;
      use_mpris = true;
    };
  };
}
