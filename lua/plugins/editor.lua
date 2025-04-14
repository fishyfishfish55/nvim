return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000 ,
    config = function()
      vim.g.gruvbox_material_foreground = 'original'
      vim.cmd.colorscheme('gruvbox-material')
    end
  },
  {"brenoprata10/nvim-highlight-colors", config = true},
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
    dependencies = {
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
    },
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
      require("telescope").load_extension("undo")
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
