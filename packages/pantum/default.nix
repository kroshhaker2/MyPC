{
  lib,
  stdenv,
  requireFile,
  dpkg,
  autoPatchelfHook,
  glibc,
  cups,
  libusb1,
  libjpeg8,
}:

stdenv.mkDerivation {
  pname = "pantum-bm2300aw";
  version = "1.1.188";

  # Proprietary vendor archive: keep it out of Git and add it to the Nix
  # store once with the command from the build error below.
  src = requireFile {
    name = "pantum_1.1.188-1_amd64.deb";
    sha256 = "sha256-yRd7yUcozey3pOr5D/E2FYj0ksPoEPxULj3KRMOnjuc=";
    url = "https://global.pantum.com/support/download/driver/";
  };

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
  ];

  buildInputs = [
    glibc
    cups
    libusb1
    libjpeg8
  ];

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    dpkg-deb -x "$src" "$out"

    # Debian -> NixOS CUPS model directory
    if [ -d "$out/usr/share/cups" ]; then
      mkdir -p "$out/share"
      cp -a "$out/usr/share/cups" "$out/share/"
    fi

    # Debian -> NixOS CUPS filters/backends
    if [ -d "$out/usr/lib/cups" ]; then
      mkdir -p "$out/lib"
      cp -a "$out/usr/lib/cups" "$out/lib/"
    fi

    # Pantum SANE backend/libraries
    if [ -d "$out/usr/lib/x86_64-linux-gnu/sane" ]; then
      mkdir -p "$out/lib"
      cp -a "$out/usr/lib/x86_64-linux-gnu/sane" "$out/lib/"
    fi

    if [ -d "$out/usr/local/lib/sane" ]; then
      mkdir -p "$out/lib"
      cp -a "$out/usr/local/lib/sane" "$out/lib/"
    fi

    runHook postInstall
  '';

  meta = {
    description = "Official Pantum BM2300AW Linux printer driver";
    homepage = "https://www.pantum.com/";
    license = lib.licenses.unfree;
    platforms = [ "x86_64-linux" ];
  };
}
