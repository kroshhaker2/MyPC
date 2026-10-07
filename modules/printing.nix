{ pkgs, ... }:

let
  pantum-bm2300aw = pkgs.callPackage ../packages/pantum/default.nix { };
in
{
  services.printing = {
    enable = true;
    drivers = [
      pantum-bm2300aw
      pkgs.gutenprint
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.ipp-usb.enable = true;
}
