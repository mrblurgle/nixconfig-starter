{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.helix];

  home.file = {
    "${config.xdg.configHome}/helix".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/source/nixconfig-starter/home/helix/config";
  };
}