return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "navarasu/onedark.nvim" },
  { "catppuccin/nvim" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
