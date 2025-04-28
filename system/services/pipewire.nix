{ pkgs, config, ... }:
{
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = false;

    configPackages = [
      (pkgs.writeTextDir "share/pipewire/pipewire.conf.d/10-low-latency.conf" ''
        context.properties = {
          default.clock.rate          = 48000
          default.clock.quantum       = 128
          default.clock.min-quantum   = 32
          default.clock.max-quantum   = 2048
          default.clock.quantum-limit = 8192
        }
      '')
    ];
  };
}

