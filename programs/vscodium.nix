{ pkgs, ... }:

let
  openVsxExtension =
    {
      publisher,
      name,
      version,
      hash,
    }:
    pkgs.vscode-utils.buildVscodeExtension {
      pname = name;
      inherit version;

      vscodeExtPublisher = publisher;
      vscodeExtName = name;
      vscodeExtUniqueId = "${publisher}.${name}";

      src = pkgs.fetchurl {
        url = "https://open-vsx.org/api/${publisher}/${name}/${version}/file/${publisher}.${name}-${version}.vsix";
        name = "${publisher}.${name}-${version}.vsix";
        inherit hash;
      };
    };

  openVsxExtensions = map openVsxExtension [
    {
      publisher = "ardonplay";
      name = "vscode-jetbrains-icon-theme";
      version = "0.0.4";
      hash = "sha256-mY1bKGabz0G148AORvEGmUhWo8K9Ews+BD38T6+Ixg8=";
    }
    {
      publisher = "barbosshack";
      name = "crates-io";
      version = "0.7.7";
      hash = "sha256-tupsTX6ho94zL4jMRjQy/caynVibkuXbyIE5x+vv6SQ=";
    }
    {
      publisher = "kroperuk";
      name = "vscode-github-actions";
      version = "0.34.0";
      hash = "sha256-Z11MZwmg0IMBhroQl6nljBFrwqooIxGGZxWM5Svts2w=";
    }
    {
      publisher = "kylinideteam";
      name = "cmake-intellisence";
      version = "0.8.1";
      hash = "sha256-SpGbYHoXXDFb8JXhUZ6UUfZZL16FgtOlqAZDrhayTTM=";
    }
    {
      publisher = "kylinideteam";
      name = "kylin-cmake-tools";
      version = "0.4.3";
      hash = "sha256-slQyRSqnjt4J/GhE7lDEke2hEZDd+8IIGSf+flLeolw=";
    }
    {
      publisher = "lch";
      name = "nginx-beautifier";
      version = "1.0.2";
      hash = "sha256-STYvjI/2ojaYeRfdMGw9D0yVt+5aVQVTXjnpDCHKp/0=";
    }
    {
      publisher = "miguelsolorio";
      name = "symbols";
      version = "0.0.26";
      hash = "sha256-RgfZFIBMJi7YpyLz0CS+/jMXT3d+1k+y269Pi/rsSaM=";
    }
    {
      publisher = "mpmischitelli";
      name = "gtk-css";
      version = "1.5.0";
      hash = "sha256-qNTBchR0ZziBjoUA/sfhUFCY42U/j0L34qkW+Vc6Pfg=";
    }
    {
      publisher = "oouo-diogo-perdigao";
      name = "docthis";
      version = "0.8.2";
      hash = "sha256-qIPAo41UZz+VMXmqlMVeW42Zsuef9SRH+yeug40VwjE=";
    }
    {
      publisher = "prisma";
      name = "prisma-insider";
      version = "31.12.11";
      hash = "sha256-OsF8pKQ6l+kiHY3WHFdbWiNsepaOQMucFXH3lvceyxM=";
    }
    {
      publisher = "slint";
      name = "slint-nightly";
      version = "2026.9.2521";
      hash = "sha256-wH2rqYTqAyiODPH2QcMFAC8LrKZtH2OtUUWbRO9dzE0=";
    }
    {
      publisher = "squarewave";
      name = "linker-script-syntax";
      version = "1.1.0";
      hash = "sha256-kLhNRbSHet0Z92vDreb6+m2rmK84PpQ1NBBNtlFBsnY=";
    }
    {
      publisher = "usernamehw";
      name = "commands";
      version = "1.22.0";
      hash = "sha256-+6j8WX28Gt+dWoNd0GI4zpeNVNfN6EGMhjwY0KELotw=";
    }
    {
      publisher = "yandeu";
      name = "five-server";
      version = "0.4.0";
      hash = "sha256-oN4tZATw87M9XGmG2w0QlMPBE3Csv5jw1gZ+G1QGwqk=";
    }
  ];
in
{
  programs.vscodium = {
    enable = true;

    profiles.default = {
      extensions =
        (with pkgs.vscode-extensions; [
          pkgs.vscode-extensions."13xforever".language-x86-64-assembly
          bradlc.vscode-tailwindcss
          christian-kohler.path-intellisense
          dbaeumer.vscode-eslint
          docker.docker
          editorconfig.editorconfig
          esbenp.prettier-vscode
          foxundermoon.shell-format
          github.github-vscode-theme
          humao.rest-client
          jnoortheen.nix-ide
          leonardssh.vscord
          llvm-vs-code-extensions.vscode-clangd
          mikestead.dotenv
          mkhl.direnv
          ms-python.python
          ms-python.vscode-python-envs
          ms-vscode.cpptools
          redhat.vscode-yaml
          rust-lang.rust-analyzer
          sumneko.lua
          tamasfe.even-better-toml
          timonwong.shellcheck
        ])
        ++ openVsxExtensions;

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
