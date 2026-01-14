local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key (space)
vim.g.mapleader = ' '

-- Ctrl+u/d → move half-page and recenter
map('n', '<C-u>', '<C-u>zz', opts)
map('n', '<C-d>', '<C-d>zz', opts)

-- Space+Space → Telescope file picker in current directory
map('n', '<leader><leader>', function()
  require('telescope.builtin').find_files { cwd = vim.loop.cwd() }
end, { desc = 'Find files in current directory' })

-- Visual mode: Space+y → copy to system clipboard
map('v', '<leader>y', '"+y', { desc = 'Yank to clipboard' })

-- Visual line mode: Shift+J/K → move selected lines up/down
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move lines down', noremap = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move lines up', noremap = true })

-- Optional: toggle netrw for quick directory browsing
map('n', '<leader>pd', ':Explore<CR>', { desc = 'Open directory picker' })

map('n', '<C-s>', ':w<CR>', { desc = 'Save file' })
map('i', '<C-s>', '<Esc>:w<CR>a', { desc = 'Save file in insert mode' })

-- Ctrl+w → close current buffer
map('n', '<C-w>', ':bd<CR>', { desc = 'Close buffer' })

-- Ctrl+q → quit Neovim
map('n', '<C-q>', ':qa<CR>', { desc = 'Quit Neovim' })
