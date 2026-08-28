{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "Hack Nerd Font";
      size = 14;
    };
  };
}
