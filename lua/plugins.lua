return {
   {
       "folke/which-key.nvim",
       event = "VeryLazy",
       opts = {
         spec = {
           { "<C-S>", "<cmd>w<cr>", desc = "Save" },
           { "<leader>P", '"*p', desc = "Paste Before from System Clipboard" },
           { "<leader>p", '"*p', desc = "Paste from System Clipboard" },
           { "<leader>y", '"*y', desc = "Copy to System Clipboard" },
           { "<leader>f", ":Telescope find_files<cr>", desc = "File picker", mode = "n"},
           { "<leader>b", ":Telescope buffers<cr>", desc = "File picker", mode = "n"},
           { "<C-S>", "<cmd>w<cr>", desc = "Save", mode = "i" },
         },
       },
       keys = {
         {
           "<leader>?",
           function()
             require("which-key").show({ global = false })
           end,
           desc = "Buffer Local Keymaps (which-key)",
         },
       },
   },
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
  { "echasnovski/mini.surround", version = '*', config = true },
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
  { 'alexghergh/nvim-tmux-navigation', config = function()
  
      local nvim_tmux_nav = require('nvim-tmux-navigation')
  
      nvim_tmux_nav.setup {
          disable_when_zoomed = true -- defaults to false
      }
  
      vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
  
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
