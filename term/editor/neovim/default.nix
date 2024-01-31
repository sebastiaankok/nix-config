{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.onedark.enable = true;

    luaLoader.enable = true;

    options = {
      number = true; # Show line numbers
      updatetime = 100; # Faster completion
      tabstop = 2; # Number of spaces a <Tab> in the text stands for (local to buffer)
      shiftwidth = 2; # Number of spaces used for each step of (auto)indent (local to buffer)
      softtabstop = 0; # If non-zero, number of spaces to insert for a <Tab> (local to buffer)
      expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)
      autoindent = true; # Do clever autoindenting

      # Disable mouse
      mouse = "";
    };

    highlight.ExtraWhitespace.bg = "red";
    match.ExtraWhitespace = "\\s\\+$";

    # Example on how to change settings for certain files.
    autoCmd = [
      {
        event = "FileType";
        pattern = "nix";
        command = "setlocal tabstop=2 shiftwidth=2";
      }
    ];
  };
  imports = [
    ./completion.nix
    ./plugins/lsp.nix
    ./plugins/gitsigns.nix
    ./plugins/autopairs.nix
    ./plugins/colorizer.nix
  ];

}
