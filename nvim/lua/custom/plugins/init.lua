-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'dracula/vim',
    name = 'dracula',
    lazy = false, -- load immediately
    priority = 1000, -- load before other plugins
    config = function()
      -- Set Dracula as the colorscheme
      vim.cmd 'colorscheme dracula'

      -- Optional settings
      vim.g.dracula_colorterm = 0 -- disable true color in some terminals if needed
      vim.g.dracula_italic_comment = 1 -- italic comments
      vim.g.dracula_italic_keyword = 1 -- italic keywords
      vim.g.dracula_italic_function = 0 -- functions not italic
      vim.g.dracula_italic_variable = 0 -- variables not italic
      vim.g.dracula_show_end_of_buffer = 1 -- show tildes
    end,
  },
}
