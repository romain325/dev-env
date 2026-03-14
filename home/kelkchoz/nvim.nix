{ inputs, pkgs, ... }:

{
  home.file.".config/nvim".source = "${inputs.dots.outPath}/nvim";
  
  home.packages = with pkgs; [
    nixd
    nixfmt
  ];
}
