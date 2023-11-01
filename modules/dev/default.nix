{pkgs, ...}: {
  home.packages = [
    pkgs.clang
    pkgs.gnumake

    pkgs.nodejs_20

    pkgs.purs
    pkgs.purs-tidy
    pkgs.spago-unstable
    pkgs.purs-backend-es

    pkgs.python3

    pkgs.go
  ];
}
