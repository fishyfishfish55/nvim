vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use {'wbthomason/packer.nvim'}
	-- Sweet tokyo night theme
	use {'folke/tokyonight.nvim'}
	-- Sweeter nord theme
	use {'arcticicestudio/nord-vim'}
	-- Awesome dashboard
	use {'glepnir/dashboard-nvim'}
	-- Tree with icons
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
		'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {'nvim-lua/plenary.nvim'}
	}
	-- Git diff gutter
	use {'lewis6991/gitsigns.nvim'}
	-- Statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- Tabline
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}
	-- Configurations for Nvim LSP
	use {'neovim/nvim-lspconfig'}
	use {'simrat39/rust-tools.nvim'}
	-- Snippets
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'hrsh7th/cmp-cmdline'}
	use {'hrsh7th/nvim-cmp'}
	use {'L3MON4D3/LuaSnip'}
	use {'saadparwaiz1/cmp_luasnip'}
	--Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	-- Auto pairs
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
end)
