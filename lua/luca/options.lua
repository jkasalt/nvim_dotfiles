local o = vim.opt
local hi = require("vim.highlight")

o.backup = false
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.completeopt = {"menuone", "noselect"}
o.fileencoding = "utf-8"
o.hlsearch = true
o.ignorecase = true
o.mouse = "a"
o.pumheight = 10
o.showmode = false
o.showtabline = 2
o.smartcase = true
o.smartindent = true
o.smarttab = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.termguicolors = true
o.timeoutlen = 1000
o.undofile = true
o.updatetime = 300
o.writebackup = false
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.cursorline = true
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.signcolumn = "yes"
o.wrap = false
o.scrolloff = 8
o.sidescrolloff = 8
o.conceallevel = 2
o.background = "dark"
o.autowriteall = true
vim.g.tex_conceal = "abdgm"

vim.opt.guifont = "monospace:h17"

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
