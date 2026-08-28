{
  config,
  lib,
  pkgs,
  ...
}:

{
  systemd.services.sing-box = {
    description = "sing-box";

    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    serviceConfig = {
      Type = "simple";

      ExecStart = "${pkgs.sing-box}/bin/sing-box run -c /home/krosh/.config/sing-box/config.json";

      Restart = "on-failure";
      RestartSec = 3;

      User = "root";
      Group = "root";
    };
  };
}
