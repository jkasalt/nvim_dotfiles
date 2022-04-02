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
 	use 'junegunn/seoul256.vim'
	use "ellisonleao/gruvbox.nvim"
	use "rebelot/kanagawa.nvim"
	use 'RRethy/nvim-base16'

	-- Misc
	use 'lervag/vimtex'
	use 'KeitaNakamura/tex-conceal.vim'
	use 'j-hui/fidget.nvim'
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
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
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	}
    use "windwp/nvim-autopairs"
end)
