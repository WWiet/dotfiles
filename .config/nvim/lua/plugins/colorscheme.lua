return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "navarasu/onedark.nvim" },
  { "catppuccin/nvim" },
  { "aktersnurra/no-clown-fiesta.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
