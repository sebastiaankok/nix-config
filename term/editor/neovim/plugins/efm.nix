{
  programs.nixvim.plugins = {

    efmls-configs.setup = let
      shellTools = {
        formatter = "shfmt";
        linter = "shellcheck";
      };
    in {
      bash = shellTools;
      sh = shellTools;
    };

    lsp.servers.efm = {
      enable = true;
      extraOptions.init_options = {
        documentFormatting = true;
        documentRangeFormatting = true;
        hover = true;
        documentSymbol = true;
        codeAction = true;
        completion = true;
        filetypes = [
          "bash"
          "sh"
        ];
      };
    };

    lsp-format = {
      enable = true;
      lspServersToEnable = ["efm"];
    };

    efmls-configs.enable = true;
  };
}
