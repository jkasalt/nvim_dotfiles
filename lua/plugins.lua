return require('packer').startup(function()

--- Essentials ---
use {'nvim-treesitter/nvim-treesitter',
    run= ':TSUpdate'
}

use 'nvim-treesitter/nvim-treesitter-textobjects'
use {
  'ojroques/nvim-lspfuzzy',
  requires = {
    {'junegunn/fzf'},
    {'junegunn/fzf.vim'},  -- to enable preview (optional)
  },
}

use 'neovim/nvim-lspconfig'
use 'preservim/nerdtree'
use 'preservim/nerdcommenter'
use 'windwp/nvim-autopairs'
use 'tpope/vim-surround'
use 'tpope/vim-fugitive'
use 'tpope/vim-rhubarb'
use 'tpope/vim-commentary'
use 'preservim/tagbar'
use 'ludovicchabant/vim-gutentags' -- Automatic tags management
use 'junegunn/vim-easy-align'
-- use 'glepnir/lspsaga.nvim'
use 'wbthomason/packer.nvim'

-- --- Completion ---
use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/vim-vsnip'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-vsnip'
use 'hrsh7th/cmp-path'
-- use 'hrsh7th/cmp-latex-symbols'
use 'ray-x/cmp-treesitter'
-- use 'L3MON4D3/LuaSnip' -- Snippets plugin

-- --- Language Specific Helpers ---
use 'jalvesaq/Nvim-R'
use 'lervag/vimtex'
use 'vim-pandoc/vim-pandoc'
use 'vim-pandoc/vim-pandoc-syntax'
use 'cespare/vim-toml'

-- --- Aesthetics ---
use 'junegunn/goyo.vim'
use 'junegunn/seoul256.vim'
use 'vim-airline/vim-airline'
use 'vim-airline/vim-airline-themes'
use 'powerline/powerline'
use 'ap/vim-css-color'
use 'nekonako/xresources-nvim'
use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
--- Miscellaneous ---
use 'vimwiki/vimwiki'
use 'jreybert/vimagit'

end)
