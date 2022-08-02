{pkgs, ...}: {
  home.packages = with pkgs.pursPkgs; [
    purs
    purs-tidy
    spago
    pscid
    purescript-language-server
    pkgs.nodejs-16_x
  ];
}
