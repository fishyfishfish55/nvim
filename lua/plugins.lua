vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use {'wbthomason/packer.nvim'}
	-- Sweet tokyo night theme
	use {
		'folke/tokyonight.nvim',
-- 		config = function () require("tokyonight-setup") end
	}
	use {
		"ellisonleao/gruvbox.nvim",
--		config = function ()
--			vim.cmd([[colorscheme gruvbox]])
--		end
	}
	use {
		"EdenEast/nightfox.nvim",
		config = function ()
			vim.cmd("colorscheme nordfox")
		end
	}
	-- Awesome dashboard
	use {
		'goolord/alpha-nvim',
		config = function ()
			require'alpha'.setup(require'alpha.themes.dashboard'.config)
		end
	}
	-- Tree with icons
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
		'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly', -- optional, updated every week. (see issue #1193)
		config = function() require("nvim-tree").setup() end
	}
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {'nvim-lua/plenary.nvim'}
	}
	-- Git diff gutter
	use {
		'lewis6991/gitsigns.nvim',
		config = function() require('gitsigns-setup') end
	}
	-- Statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function () require("lualine-setup") end
	}
	-- Tabline
	use {
	  'kdheepak/tabline.nvim',
	  config = function()
		require'tabline'.setup {
		  -- Defaults configuration options
		  enable = true,
		  options = {
		  -- If lualine is installed tabline will use separators configured in lualine by default.
		  -- These options can be used to override those settings.
			section_separators = {'', ''},
			component_separators = {'', ''},
			max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
			show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
			show_devicons = true, -- this shows devicons in buffer section
			show_bufnr = false, -- this appends [bufnr] to buffer section,
			show_filename_only = false, -- shows base filename only instead of relative path in filename
			modified_icon = "+ ", -- change the default modified icon
			modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
			show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
		  }
		}
		vim.cmd[[
		  set guioptions-=e " Use showtabline in gui vim
		  set sessionoptions+=tabpages,globals " store tabpages and globals in session
		]]
	  end,
	  requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
	}
	-- Configurations for Nvim LSP
	use {'neovim/nvim-lspconfig'}
	use {'simrat39/rust-tools.nvim'}
	-- Snippets
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'hrsh7th/cmp-cmdline'}
	use {
		'hrsh7th/nvim-cmp',
		config = function () require("nvim-cmp-setup") end
	}
	use {'L3MON4D3/LuaSnip'}
	use {'saadparwaiz1/cmp_luasnip'}
	--Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require("treesitter-setup") end
	}
	-- Auto pairs
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
end)
