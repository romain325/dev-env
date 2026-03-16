{ config, pkgs, ... }:

{
  imports =
    [ ./git.nix ./hyprland.nix ./misc.nix ./nvim.nix ./ai.nix ./zsh.nix ];
  home.username = "kelkchoz";
  home.homeDirectory = "/home/kelkchoz";

  home.packages = with pkgs; [ ripgrep fzf eza btop zoxide kitty bat fd ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  home.stateVersion = "25.05";
}
