{
  config,
  pkgs,
  ...
}: {
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = false;
    wireplumber.enable = true;
  };

  services.power-profiles-daemon.enable = false;

  environment.etc = {
    "wireplumber/main.lua.d/90-suspend-timeout.lua".text = ''
      apply_properties = {
        ["session.suspend-timeout-seconds"] = 0;
      };
    '';
  };
}
