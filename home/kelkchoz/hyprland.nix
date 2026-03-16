{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    settings = {
      debug = { disable_logs = false; };
      "exec-once" = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];
      "monitor" = "Virtual-, 1920x1080, 0x0, 1";
    };
    systemd.enable = false;
  };

  home.file.".config/hypr".source = "${inputs.dots.outPath}/hypr";
  home.file.".config/waybar".source = "${inputs.dots.outPath}/waybar";
  home.file.".config/dunst".source = "${inputs.dots.outPath}/dunst";
  home.file.".config/rofi".source = "${inputs.dots.outPath}/rofi";
  home.file.".config/kitty".source = "${inputs.dots.outPath}/kitty";
  home.file.".config/wallpapers".source = "${inputs.dots.outPath}/wallpapers";

  home.sessionVariables.NIXOS_OZONE_WL = "1";
  home.sessionVariables.LIBGL_ALWAYS_SOFTWARE = "1";

  home.packages = with pkgs; [
    hyprlock
    inputs.hyprls.packages.${pkgs.stdenv.hostPlatform.system}.default
    wl-clipboard
    cliphist
    swaybg
    waybar
    dunst
    rofi-wayland
  ];

}
