{pkgs, ...}: {
  home.packages = [
    pkgs.clang
    pkgs.gnumake
  ];
}
