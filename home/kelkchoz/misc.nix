{ pkgs, ... }:

{

  home.packages = with pkgs; [ 
    firefox
    nerd-fonts.fira-code 
  ];

}
