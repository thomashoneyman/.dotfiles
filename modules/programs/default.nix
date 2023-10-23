{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    spotify
    obsidian
    element-desktop
    ledger-live-desktop
    slack
    protonvpn-cli
    protonvpn-gui
  ];

  programs.firefox.enable = true;

  programs.brave.enable = true;

  programs.vscode = {
    enable = true;
    userSettings = {
      "[css]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[html]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[json]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[nix]" = {
        "editor.defaultFormatter" = "kamadorueda.alejandra";
      };
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };

      "alejandra.program" = "alejandra";

      "editor.minimap.enabled" = false;
      "editor.fontSize" = 14;
      "editor.lineHeight" = 24;
      "editor.fontFamily" = "IBM Plex Mono, Hasklig, monospace";
      "editor.fontLigatures" = true;
      "editor.tabSize" = 2;
      "editor.rulers" = [80 100];
      "editor.formatOnSave" = true;
      "editor.inlineSuggest.enabled" = true;

      "files.trimTrailingWhitespace" = true;
      "files.trimFinalNewlines" = true;
      "files.insertFinalNewline" = true;

      "purescript.formatter" = "purs-tidy";

      "settingsSync.keybindingsPerPlatform" = false;

      "telemetry.telemetryLevel" = "off";

      "terminal.external.linuxExec" = "alacritty";
      "terminal.integrated.drawBoldTextInBrightColors" = false;
      "terminal.integrated.fontSize" = 14;

      "update.mode" = "manual";

      "window.menuBarVisibility" = "toggle";
      "window.titleBarStyle" = "custom";
      "window.zoomLevel" = 0.5;

      "workbench.colorTheme" = "Nord";
    };
  };
}
