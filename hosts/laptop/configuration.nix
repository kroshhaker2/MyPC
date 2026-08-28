{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../../programs/easyeffects.nix
    ../../daemons/sing-box.nix
  ];

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  zramSwap.enable = true;

  networking.hostName = "nixos";
  # networking.wireless.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

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

  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  security.polkit = {
    enable = true;
    enablePkexecWrapper = true;
  };

  security.wrappers.nekobox-pkexec = {
    source = "${pkgs.polkit}/bin/pkexec";
    owner = "root";
    group = "root";
    permissions = "u+rx";
  };

  services.xserver.xkb = {
    layout = "ru";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
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
  ];

  # services.openssh.enable = true;

  system.stateVersion = "26.05";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
