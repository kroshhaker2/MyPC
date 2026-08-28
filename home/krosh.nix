{ config, pkgs, ... }:

{
  home.username = "krosh";
  home.homeDirectory = "/home/krosh";

  home.stateVersion = "26.11";

  home.packages = with pkgs; [
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
    nixfmt-rfc-style
    imv
    mpv
    jetbrains.idea
    spotify
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
  ];
}
