{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_greeting

      # Keep shell startup readable in dropdown and other small terminals.
      if test "$COLUMNS" -ge 110
        fastfetch
      else if test "$COLUMNS" -ge 45
        fastfetch --logo none
      end
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
      nsys = "nvim /etc/nixos/hosts/laptop/configuration.nix";
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
}
