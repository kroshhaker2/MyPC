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
        tamasfe.even-better-toml
      ];

      userSettings = {
        "editor.fontSize" = 14;
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "workbench.tree.indent" = 20;
        "files.autoSave" = "afterDelay";
        "terminal.integrated.defaultProfile.linux" = "fish";
        "editor.fontFamily" = "Hack Nerd Font";

        "crates.compatibleDecorator" = " 󰄬";
        "crates.errorDecorator" = " 󰅖";
        "crates.incompatibleDecorator" = " 󰅖 \${version}";
      };
    };
  };
}
