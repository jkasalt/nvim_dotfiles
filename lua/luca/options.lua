local o = vim.opt

o.backup = false
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.completeopt = {"menuone", "noselect"}
o.conceallevel = 0
o.fileencoding = "utf-8"
o.hlsearch = true
o.ignorecase = true
o.mouse = "a"
o.pumheight = 10
o.showmode = false
o.showtabline = 2
o.smartcase = true
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.timeoutlen = 1000
o.undofile = true
o.updatetime = 300
o.writebackup = false
o.expandtab = false
o.shiftwidth = 4
o.tabstop = 4
o.cursorline = true
o.relativenumber = true
o.numberwidth = 2
o.signcolumn = "yes"
o.wrap = false
o.scrolloff = 8
o.sidescrolloff = 8

vim.opt.guifont = "monospace:h17"

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
