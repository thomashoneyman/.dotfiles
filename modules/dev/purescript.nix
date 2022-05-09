{
  config,
  pkgs,
  lib,
  ...
}: let
  purescriptConfig = config.modules.dev.purescript;
in {
  options.modules.dev.purescript = {
    enable = lib.mkEnableOption "purescript";
  };

  config = lib.mkIf purescriptConfig.enable {
    home.packages = with pkgs.pursPkgs; [
      purs
      purs-tidy
      spago
      pscid
      purescript-language-server
      pkgs.nodejs-16_x
      pkgs.nodePackages.bower
    ];
  };
}
