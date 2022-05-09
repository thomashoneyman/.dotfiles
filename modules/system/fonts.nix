{
  config,
  pkgs,
  ...
}: {
  fonts.fonts = with pkgs; [
    hasklig
    source-code-pro
    cascadia-code
    roboto
    inter
    noto-fonts-emoji-blob-bin
  ];

  fonts.fontconfig = {
    antialias = true;
    hinting.enable = true;
    defaultFonts = {
      monospace = ["Hasklig"];
      sansSerif = ["Source Sans Pro"];
      serif = ["Source Serif Pro"];
      emoji = ["Blobmoji"];
    };
  };
}
