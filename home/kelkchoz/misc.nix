{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libnotify
    firefox
    yazi
    nerd-fonts.fira-code
    mise
  ];
}
