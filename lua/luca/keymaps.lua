-- Basic
local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

-- Remap Leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal mode
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Toggle "Left Explore"
keymap("n", "<leader>e", ":Lex 30 <CR>", opts)

-- Resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>", opts)

-- Better terminal control
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap('t', 'jk', "<C-\\><C-n>", opts)
keymap('t', '<C-h>', "<C-\\><C-n><C-W>h", opts)
keymap('t', '<C-j>', "<C-\\><C-n><C-W>j", opts)
keymap('t', '<C-k>', "<C-\\><C-n><C-W>k", opts)
keymap('t', '<C-l>', "<C-\\><C-n><C-W>l", opts)
