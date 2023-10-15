{pkgs, ...}: {
  home.packages = [
    pkgs.purs
    pkgs.purs-tidy
    pkgs.spago-unstable
    pkgs.purescript-language-server
  ];
}
