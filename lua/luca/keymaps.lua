-- Basic
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Remap Leader
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal mode
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Better "write" mapping
keymap("n", "<leader>ww", "<cmd>w<cr>", opts)

-- Toggle "Left Explore"
keymap("n", "<leader>a", function() return require 'nvim-tree'.toggle() end, opts)

-- Resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", function() return require('telescope.builtin').find_files() end, opts)
keymap("n", "<leader>fg", function() return require('telescope.builtin').live_grep() end, opts)
keymap("n", "<leader>fb", function() return require('telescope.builtin').buffers() end, opts)
keymap("n", "<leader>fh", function() return require('telescope.builtin').oldfiles() end, opts)

-- Better terminal control
keymap("n", "<leader>t", ":ToggleTerm<cr>", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap('t', 'jk', "<C-\\><C-n>", opts)
keymap('t', '<C-h>', "<C-\\><C-n><C-W>h", opts)
keymap('t', '<C-j>', "<C-\\><C-n><C-W>j", opts)
keymap('t', '<C-k>', "<C-\\><C-n><C-W>k", opts)
keymap('t', '<C-l>', "<C-\\><C-n><C-W>l", opts)
