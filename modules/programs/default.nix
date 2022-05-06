{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    spotify
    obsidian
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
      "editor.fontSize" = 15;
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

      "settingsSync.keybindingsPerPlatform" = false;

      "telemetry.telemetryLevel" = "off";

      "terminal.external.linuxExec" = "alacritty";
      "terminal.integrated.drawBoldTextInBrightColors" = false;
      "terminal.integrated.fontSize" = 15;

      "update.mode" = "manual";

      "window.menuBarVisibility" = "toggle";

      "workbench.colorTheme" = "Nord";
    };
  };
}
