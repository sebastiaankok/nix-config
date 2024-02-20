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
      lf = "eza -lF --color=always --icons=always | grep -v /";
      lh = "eza -dl --group-directories-first --icons=always";
      ll = "eza -al --group-directories-first --icons=always";
      ls = "eza -alF --color=always --sort=size --icons=always | grep -v /";
      lt = "eza -al --sort=modified --icons=always";
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
