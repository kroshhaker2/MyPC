{ pkgs }:

let
  nekoboxSrc = pkgs.fetchurl {
    url = "https://github.com/qr243vbi/nekobox/releases/download/5.11.28.2/nekobox-5.11.28.2-x86_64-linux.AppImage";
    hash = "sha256:153b2be73bb9621b12c744bd108d024edffb9b209f10b0bc81510df7c34de0ce";
  };

  extracted = pkgs.appimageTools.extractType2 {
    pname = "nekobox";
    version = "5.11.28.2";
    src = nekoboxSrc;
  };
in

pkgs.appimageTools.wrapType2 {
  pname = "nekobox";
  version = "5.11.28.2";

  src = nekoboxSrc;

  extraInstallCommands = ''
    install -Dm644 \
      ${extracted}/nekobox.desktop \
      $out/share/applications/nekobox.desktop

    install -Dm644 \
      ${extracted}/public/icon.png \
      $out/share/icons/hicolor/256x256/apps/Tun.png
  '';
}
