{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        ms-python.python
        ms-vscode.cpptools
        rust-lang.rust-analyzer
      ];

      userSettings = {
        "editor.fontSize" = 14;
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "files.autoSave" = "afterDelay";
        "terminal.integrated.defaultProfile.linux" = "fish";
      };
    };
  };
}
