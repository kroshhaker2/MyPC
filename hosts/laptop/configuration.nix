{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../../daemons/sing-box.nix
    ../../modules/desktop.nix
    ../../modules/hyprland.nix
    ../../modules/printing.nix
    ../../modules/remote-access.nix
    ../../modules/virtualisation.nix
    ../../modules/xkb.nix
  ];

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  zramSwap = {
    enable = true;
    memoryPercent = 100;
    algorithm = "zstd";
  };

  networking.hostName = "nixos";
  # networking.wireless.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  programs.fish.enable = true;
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
    ];
  };

  users.users."krosh" = {
    isNormalUser = true;
    description = "Krosh";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [

    ];
  };

  programs.appimage = {
    enable = true;
  };

  services.flatpak.enable = true;

  programs.firefox.enable = false;

  programs.steam = {
    enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.system}".default
    wget
    git
    neovim
    fastfetch
    htop
    curl
    tree
    unzip
    zip
    p7zip
    pciutils
    usbutils
    util-linux
    easyeffects
    sing-box
    python3
    file
    glib
    android-tools
    docker
    fluxbox
    tigervnc
  ];

  system.stateVersion = "26.05";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}
