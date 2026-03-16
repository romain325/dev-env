{ pkgs, inputs, ... }:

{
  home.packages = [ inputs.opencode.packages.${pkgs.system}.default ];
  home.file.".config/opencode/opencode.json".source =
    "${inputs.dots.outPath}/opencode/opencode.json";
}
