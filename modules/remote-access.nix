{ pkgs, ... }:

{
  users.users.remote = {
    isNormalUser = true;
    createHome = true;
    shell = pkgs.fish;
    packages = with pkgs; [
      kitty
    ];
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22
    ];
  };
}
