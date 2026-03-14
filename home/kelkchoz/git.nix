{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lazygit
    gh
  ];

  programs.git = {
    enable = true;
    userName = "kelkchoz";
    userEmail = "romainolivier42@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
