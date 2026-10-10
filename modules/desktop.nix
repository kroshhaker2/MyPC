{ pkgs, ... }:

{
  imports = [
    ../programs/easyeffects.nix
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  services.xserver = {
    enable = true;
    xkb = {
      layout = "ru";
      variant = "";
    };
  };

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  security.polkit = {
    enable = true;
    enablePkexecWrapper = true;
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  programs.fuse.userAllowOther = true;

  fonts.packages = with pkgs; [
    corefonts
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    gwenview
    okular
    kate
    khelpcenter
    baloo
    dolphin-plugins
    dolphin
    discover
    qrca
    ark
    konsole
  ];
}
