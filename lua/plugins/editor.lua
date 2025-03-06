return {
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
  {
  "nvim-lualine/lualine.nvim", config = function()
    require('lualine').setup {
      options = {theme = 'gruvbox'},
      sections = {
        lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end }},
        lualine_b = {},
        lualine_c = {{'filename', path=1, symbols = { modified='⭑'}}},
        lualine_x = {"filetype"},
        lualine_y = {'diagnostics'},
      },
    }
  end
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      require('telescope').setup {
      pickers = {
        buffers = {
        mappings = {
          n = {
          ["dd"] = "delete_buffer",
          }
        }
        }
      }
      }
    end
  },
  {'nvim-telescope/telescope-symbols.nvim'},
  {'akinsho/git-conflict.nvim', version = "*", config = true},
  {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      word_diff = true,
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 200,
      },
    }
  end
  },
}
