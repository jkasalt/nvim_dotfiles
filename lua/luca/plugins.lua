local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function()
    -- Basics
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'terrortylor/nvim-comment'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require 'nvim-tree'.setup {} end
    }
    use 'ur4ltz/surround.nvim'
    use 'tpope/vim-surround'
    use { 'windwp/nvim-autopairs',
        config = function()
            require "nvim-autopairs".setup({
                check_ts = true,
                enable_check_bracket_line = false,
                ignored_next_char = "[%w%.]",
            })
        end
    }
    use { 'mizlan/iswap.nvim',
        config = function()
            require "iswap".setup {}
        end
    }


    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'saadparwaiz1/cmp_luasnip'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Colorscheme
    use "ellisonleao/gruvbox.nvim"
    use "rebelot/kanagawa.nvim"
    use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }
    use "shaunsingh/seoul256.nvim"
    use "savq/melange"

    -- Misc
    use 'lervag/vimtex'
    use 'jalvesaq/Nvim-R'
    -- use 'KeitaNakamura/tex-conceal.vim'
    use 'j-hui/fidget.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'chrisbra/Colorizer'
    use "akinsho/toggleterm.nvim"
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }
    use { 'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup {}
    end
    }
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
