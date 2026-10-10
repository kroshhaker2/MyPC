{ ... }:

let
  wallpaper = ../../assets/wallpapers/default.png;
in
{
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;
      ipc = true;

      wallpaper = [
        {
          monitor = "";
          path = toString wallpaper;
          fit_mode = "cover";
        }
      ];
    };
  };
}
