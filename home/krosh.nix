{ config, pkgs, ... }:

{
  home.username = "krosh";
  home.homeDirectory = "/home/krosh";

  home.stateVersion = "26.11";

  home.packages = with pkgs; [
    (callPackage ../packages/nekobox.nix {})
    ayugram-desktop
    vesktop
    prismlauncher
    kitty
    nautilus
    nerd-fonts.hack
    ripgrep
    fd
    eza
    bat
    btop
    vscodium
  ];

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_greeting
      fastfetch
    '';

    shellAliases = {
      ls = "eza";
      ll = "eza -lah";
      la = "eza -a";
      l = "eza -lah";
      ".." = "cd ..";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos";
      nrt = "sudo nixos-rebuild test --flake /etc/nixos";
      nrb = "sudo nixos-rebuild boot --flake /etc/nixos";
      nrg = "sudo nixos-rebuild build --flake /etc/nixos";

      ncd = "cd /etc/nixos";
      nconf = "nvim /etc/nixos";
      nflake = "nvim /etc/nixos/flake.nix";
      nhome = "nvim /etc/nixos/home/krosh.nix";
      nsys = "nvim /etc/nixos/host/laptop/configuration.nix";
    };
  };

  programs.starship = {
  enable = true;

  settings = {
    "$schema" = "https://starship.rs/config-schema.json";

    command_timeout = 2000;

    format = builtins.concatStringsSep "" [
  "[](fg:color_bg1)"
  "$os"
  "$username"
  "$hostname"
  "[ ](fg:color_bg1 bg:color_bg2)"
  "$directory"
  "[ ](fg:color_bg2 bg:color_bg3)"
  "$git_branch"
  "$git_status"
  "[ ](fg:color_bg3 bg:color_bg4)"
  "$c"
  "$dotnet"
  "$java"
  "$kotlin"
  "$nodejs"
  "[ ](fg:color_bg4 bg:color_bg5)"
  "$cmd_duration"
  "[ ](fg:color_bg5)"
  "\n"
  "$character"
];

    palette = "ccswe_dark";

    palettes.ccswe_dark = {
      color_bg1 = "#336699";
      color_bg2 = "#2f5783";
      color_bg3 = "#294262";
      color_bg4 = "#232f44";
      color_bg5 = "#1d2230";

      color_blue = "#769ff0";
      color_gray = "#999999";
      color_red = "#eb4d28";
      color_white = "#f2f2f2";
    };

    character = {
      error_symbol = "[❯](bold color_red)";
      success_symbol = "[❯](bold color_blue)";
    };

    cmd_duration = {
      format = "[$duration](bg:color_bg5 fg:color_gray)";
      min_time = 500;
    };

    directory = {
      style = "bg:color_bg2 fg:color_white";
      format = "[$path]($style)";
      truncation_length = 3;
      truncation_symbol = "…/";
    };

    directory.substitutions = {
      Documents = "󰈙 ";
      Downloads = " ";
      Music = " ";
      Pictures = " ";
    };

    git_branch = {
      symbol = "";
      style = "bg:color_bg3 fg:color_blue";
      format = "[$symbol $branch]($style)";
    };

    git_status = {
      ahead = "⇡\${count}";
      behind = "⇣\${count}";
      deleted = "";
      diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
      format = "[( $all_status$ahead_behind)]($style)";
      style = "bold bg:color_bg3 fg:color_red";
    };

    hostname = {
      format = "[@$hostname]($style)";
      ssh_only = true;
      ssh_symbol = " ";
      style = "bg:color_bg1 fg:color_white";
    };

    os = {
      format = "[$symbol]($style)";
      style = "bg:color_bg1 fg:color_white";
      disabled = false;
    };

    username = {
      disabled = false;
      format = "[$user]($style)";
      show_always = false;
      style_root = "bg:color_bg1 fg:color_red";
      style_user = "bg:color_bg1 fg:color_white";
    };

    c = {
      format = "[$symbol]($style)";
      style = "bg:color_bg4 fg:#6295CB";
      symbol = " ";
    };

    dotnet = {
      format = "[$symbol]($style)";
      style = "bg:color_bg4 fg:#1180C3";
      symbol = " ";
    };

    java = {
      format = "[$symbol]($style)";
      style = "bg:color_bg4 fg:#F7901E";
      symbol = " ";
    };

    kotlin = {
      format = "[$symbol]($style)";
      style = "bg:color_bg4 fg:#C017E4";
      symbol = " ";
    };

    nodejs = {
      style = "bg:color_bg4 fg:#5FA04E";
      format = "[$symbol($version)]($style)";
      symbol = " ";
    };

    os.symbols = {
      Alpaquita = " ";
      Alpine = " ";
      AlmaLinux = " ";
      Amazon = " ";
      Android = " ";
      Arch = " ";
      Artix = " ";
      CentOS = " ";
      Debian = " ";
      DragonFly = " ";
      Emscripten = " ";
      EndeavourOS = " ";
      Fedora = " ";
      FreeBSD = " ";
      Garuda = "󰛓 ";
      Gentoo = " ";
      HardenedBSD = "󰞌 ";
      Illumos = "󰈸 ";
      Kali = " ";
      Linux = " ";
      Mabox = " ";
      Macos = " ";
      Manjaro = " ";
      Mariner = " ";
      MidnightBSD = " ";
      Mint = " ";
      NetBSD = " ";
      NixOS = " ";
      OpenBSD = "󰈺 ";
      openSUSE = " ";
      OracleLinux = "󰌷 ";
      Pop = " ";
      Raspbian = " ";
      Redhat = " ";
      RedHatEnterprise = " ";
      RockyLinux = " ";
      Redox = "󰀘 ";
      Solus = "󰠳 ";
      SUSE = " ";
      Ubuntu = " ";
      Unknown = " ";
      Void = " ";
      Windows = "󰍲 ";
    };
  };
};

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.git.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.kitty = {
    enable = true;

    font = {
      name = "Hack Nerd Font";
      size = 12;
    };
  };
}
