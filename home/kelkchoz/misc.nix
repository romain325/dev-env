{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libnotify
    firefox
    yazi
    nerd-fonts.fira-code
    mise
    zip
    unzip
    jq
    yq
    python3
    nodejs
    cargo
    rustc
  ];
}
