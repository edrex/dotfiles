{ config, pkgs, ... }:

{
  xdg.portal.wlr.enable = true;

  security.rtkit.enable = true; # ?

  nixpkgs.config.pulseaudio = true;
  #hardware.pulseaudio.enable = true; # we're trying pipewire
  hardware.pulseaudio.enable = pkgs.lib.mkForce false;

  users.extraUsers.edrex.extraGroups = [ "jackaudio" ];
  
  environment.systemPackages = with pkgs; [
    helvum
  ];
  
  programs.dconf.enable = true;
  # home-manager.users.cole = { pkgs, ... }: {
  #   services.easyeffects.enable = (pkgs.system == "x86_64-linux"); # TODO: ew, also why?
  # };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true; # ?
    pulse.enable = true;
    jack.enable = true;

    media-session.config.bluez-monitor.rules = [
      {
        # Matches all cards
        matches = [ { "device.name" = "~bluez_card.*"; } ];
        actions = {
          "update-props" = {
            "bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
            # mSBC is not expected to work on all headset + adapter combinations.
            "bluez5.msbc-support" = true;
            # SBC-XQ is not expected to work on all headset + adapter combinations.
            "bluez5.sbc-xq-support" = true;
          };
        };
      }
      {
        matches = [
          # Matches all sources
          { "node.name" = "~bluez_input.*"; }
          # Matches all outputs
          { "node.name" = "~bluez_output.*"; }
        ];
        actions = {
          "node.pause-on-idle" = false;
        };
      }
    ];
  };
}