{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    spotify
    obsidian
    ranger # file system
    element-desktop
    ledger-live-desktop
  ];

  services.flameshot.enable = true;

  programs.firefox.enable = true;

  programs.brave.enable = true;

  programs.vscode = {
    enable = true;
    userSettings = {
      "[html]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[json]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
      "editor.minimap.enabled" = false;
      "editor.fontSize" = 16;
      "editor.lineHeight" = 24;
      "editor.fontFamily" = "Hasklig, monospace";
      "editor.fontLigatures" = true;
      "editor.tabSize" = 2;
      "editor.rulers" = [ 80 100 ];
      "editor.formatOnSave" = true;

      "files.trimTrailingWhitespace" = true;
      "files.trimFinalNewlines" = true;
      "files.insertFinalNewline" = true;

      "purescript.formatter" = "purs-tidy";

      "telemetry.telemetryLevel" = "off";

      "terminal.external.linuxExec" = "alacritty";
      "terminal.integrated.drawBoldTextInBrightColors" = false;
      "terminal.integrated.fontSize" = 16;

      "update.mode" = "manual";

      "window.menuBarVisibility" = "toggle";
      "window.zoomLevel" = 0.5;

      "workbench.colorTheme" = "Nord";
    };
  };
}
