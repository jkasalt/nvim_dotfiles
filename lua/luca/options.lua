local o = vim.opt

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
o.number = true
o.numberwidth = 2
o.signcolumn = "yes"
o.wrap = false
o.scrolloff = 8
o.sidescrolloff = 8
o.conceallevel = 2
o.background = "dark"
o.autowriteall = true
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.g.tex_conceal = "abdgm"
vim.g.vimtex_quickfix_enabled = 0

vim.opt.guifont = "Fira_Code:h9"

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
