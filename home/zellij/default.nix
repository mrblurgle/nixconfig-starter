{ config, pkgs, ... }: {
  home.packages = [ pkgs.zellij ];

  home.file = {
    "${config.xdg.configHome}/zellij/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/source/nixconfig-starter/home/zellij/config.kdl";
    "${config.xdg.configHome}/zellij/layouts".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/source/nixconfig-starter/home/zellij/layouts";
  };
}
