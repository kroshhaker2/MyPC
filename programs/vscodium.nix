{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        editorconfig.editorconfig
        esbenp.prettier-vscode
        foxundermoon.shell-format
        jnoortheen.nix-ide
        ms-python.python
        ms-vscode.cpptools
        redhat.vscode-yaml
        rust-lang.rust-analyzer
        sumneko.lua
        tamasfe.even-better-toml
        timonwong.shellcheck
      ];

      userSettings = {
        "editor.fontSize" = 14;
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "workbench.tree.indent" = 20;
        "files.autoSave" = "afterDelay";
        "terminal.integrated.defaultProfile.linux" = "fish";
        "editor.fontFamily" = "Hack Nerd Font";

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.formatterPath" = "nixfmt";

        "Lua.diagnostics.globals" = [ "hl" ];
        "Lua.workspace.checkThirdParty" = false;

        "shellformat.path" = "shfmt";
        "shellformat.flag" = "-i 2 -ci";

        "crates.compatibleDecorator" = " 󰄬";
        "crates.errorDecorator" = " 󰅖";
        "crates.incompatibleDecorator" = " 󰅖 \${version}";
      };
    };
  };
}
