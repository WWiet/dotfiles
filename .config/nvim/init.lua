-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
-- -- Set highlight for Normal with no background
-- vim.api.nvim_set_hl(0, "Normal", { ctermbg = "none" })
--
-- -- Set highlight for NonText with no background
-- vim.api.nvim_set_hl(0, "NonText", { ctermbg = "none" })
function ToggleLineNumbers()
  if vim.wo.number then
    vim.wo.number = false
    vim.wo.relativenumber = false
  else
    vim.wo.number = true
    vim.wo.relativenumber = true
  end
end

vim.o.termguicolors = true
