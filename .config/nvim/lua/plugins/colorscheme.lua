return {
  -- add gruvbox
  -- { "scottmckendry/cyberdream.nvim" },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
      })
    end,
  },
  -- { "navarasu/onedark.nvim" },
  -- { "catppuccin/nvim" },
  -- { "aktersnurra/no-clown-fiesta.nvim" },
  -- { "projekt0n/github-nvim-theme" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        styles = {
          transparency = true,
        },
      })
    end,
  },
  { "olimorris/onedarkpro.nvim", name = "onedark" },
  -- { "rebelot/kanagawa.nvim" },
  -- { "arzg/vim-colors-xcode" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
