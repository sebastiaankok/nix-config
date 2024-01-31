{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          bashls.enable = true;
          cmake.enable = true;
          nixd.enable = true;
          # python
          ruff-lsp.enable = true;
          pylsp = {
            enable = true;
            settings = {
              plugins = {
                jedi_completion.fuzzy = true;
                pylsp_mypy.enabled = true;
                autopep8.enabled = false;
                flake8.enabled = false;
                mccabe.enabled = false;
                preload.enabled = false;
                pycodestyle.enabled = false;
                pydocstyle.enabled = false;
                pyflakes.enabled = false;
                pylint.enabled = false;
                ruff.enabled = false;
                yapf.enabled = false;
              };
            };
          };
          gopls.enable = true;
          terraformls.enable = true;
          yamlls = {
            enable = true;
            extraOptions = {
              settings = {
                yaml = {
                  schemas = {
                    kubernetes = "*.yaml";
                    "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
                    "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";

                  };
                  validate = {
                    enable = true;
                  };
                };
              };
            };
          };
          jsonls.enable = true;
          html.enable = true;
          cssls.enable = true;
        };
      };
    };
  };
}
