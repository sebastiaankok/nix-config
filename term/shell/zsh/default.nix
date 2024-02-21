{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      k = "kubecolor";
      up = "home-manager switch ; source ~/.zshrc";
      kx = "switch";
      synccluster = "export KUBECONFIG=$HOME/.kube/config; echo '' > $KUBECONFIG; tsh kube login --all --set-context-name {{.KubeName}}";
      ld = "eza -lD --icons=always" ;
      ll = "eza -l --group-directories-first --icons=always";
      ls = "eza -l --group-directories-first --icons=always";
      lS = "eza -lF --color=always --sort=size --icons=always | grep -v /";
      lt = "eza -l --sort=modified --icons=always";
      lg = "lazygit";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
        { name = "plugins/git"; tags = [ from:oh-my-zsh ]; }
        { name = "nnao45/zsh-kubectl-completion";}
        { name = "zsh-users/zsh-syntax-highlighting";}
      ];
    };

    plugins = [
      { name = "powerlevel10k-config"; src = ./p10k-config; file = "p10k.zsh"; }
    ];
  };
}
