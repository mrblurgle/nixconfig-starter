{
  config,
  pkgs,
  ...
}: {
  home.file = {
    "${config.xdg.configHome}/dunst/dunstrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/source/nixconfig-starter/home/dunst/config";
  };

  systemd.user.services.dunst = {
    Unit = {
      Description = "Dunst notification daemon";
      After = ["graphical-session-pre.target"];
      PartOf = ["graphical-session.target"];
    };

    Service = {
      Type = "dbus";
      BusName = "org.freedesktop.Notifications";
      ExecStart = "${pkgs.dunst}/bin/dunst";
    };
  };
}
