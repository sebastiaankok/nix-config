{
  programs.nixvim.plugins = {
   lualine = {
      enable = true;
      globalstatus = true;
      extensions = ["neo-tree"];
    };
  };
}
