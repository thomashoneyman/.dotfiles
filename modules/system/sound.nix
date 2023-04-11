{
  config,
  pkgs,
  ...
}: {
  # Don't use pulseaudio by default
  # https://nixos.wiki/wiki/PipeWire
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse.enable = true;
  };
}
