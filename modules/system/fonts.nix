{
  config,
  pkgs,
  ...
}: {
  fonts.packages = with pkgs; [
    hasklig
    ibm-plex
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
      monospace = ["IBM Plex Mono"];
      sansSerif = ["Source Sans Pro"];
      serif = ["Source Serif Pro"];
      emoji = ["Blobmoji"];
    };
  };
}
