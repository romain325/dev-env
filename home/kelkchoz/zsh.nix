{ inputs, pkgs, ... }:

{
  home.file.".config/shell".source = "${inputs.dots.outPath}/shell";
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    plugins = [{
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];
    initContent = ''
      source ~/.p10k.zsh
      for f in ~/.config/shell/rc/*; do source $f; done
    '';
  };
}
