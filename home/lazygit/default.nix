{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.lazygit];

  home.file = {
    "${config.xdg.configHome}/lazygit/config.yml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/source/nixconfig-starter/home/lazygit/config.yml";
  };
}
