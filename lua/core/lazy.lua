vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

  -- which-key
     { "folke/which-key.nvim",
       event = "VeryLazy",
  --     opts = {
  --     spec = {
  --       -- Copy-paste
  --       { "<leader>p", '"*p', desc = "Paste from System Clipboard" },
  --       { "<leader>y", '"*y', desc = "Copy to System Clipboard" },
  --       -- Telescope
  --       { "<leader>f", ":Telescope find_files<cr>", desc = "File picker", mode = "n"},
  --       { "<leader>b", ":Telescope buffers<cr>", desc = "Buffers", mode = "n"},
  --       { "<leader>g", ":Telescope live_grep<cr>", desc = "Find in files", mode = "n"},
  --       { "<leader>u", ":Telescope undo<cr>", desc = "Undo tree", mode = "n"},
  --       -- LSP
  --       { "<leader>l", group = "LSP" },
  --       { "<leader>ll", ":Lspsaga finder<cr>", desc = "See references", mode = "n"},
  --       { "<leader>lr", ":Lspsaga rename ++project<cr>", desc = "Rename symbol", mode = "n"},
  --       { "<leader>la", ":Lspsaga code_action<cr>", desc = "Code action", mode = "n"},
  --       { "<leader>lp", ":Lspsaga peek_definition<cr>", desc = "Peek defenition", mode = "n"},
  --       { "<leader>lP", ":Lspsaga peek_type_definition<cr>", desc = "Peek type defenition", mode = "n"},
  --       { "gd", ":Lspsaga goto_definition<cr>", desc = "Go to defenition", mode = "n"},
  --       { "gD", ":Lspsaga goto_type_definition<cr>", desc = "Go to type defenition", mode = "n"},
  --     },
  --   },
     keys = {
       {
         "<leader>?",
         function()
           require("which-key").show({ global = false })
         end,
         desc = "Buffer Local Keymaps (which-key)",
       },
     },
   }, -- which-key
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
  }, -- vim-tmux-navigation
  {
    'johmsalas/text-case.nvim',
    config = function()
      require('textcase').setup {}
      require('telescope').load_extension('textcase')
    end
  },
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
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {"c", "cpp", "lua", "query", "python", "bash", "java", "markdown", "markdown_inline",},
        highlight = {enable = true},
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = false,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            }
          }
        }
      }
    end
  },
  {'nvim-treesitter/nvim-treesitter-textobjects'},
  {
  'romgrk/nvim-treesitter-context',
  config = function()
    require'treesitter-context'.setup{
    enable = true,
    throttle = true,
    max_lines = 0,
    patterns = {
      default = {
      'class',
      'function',
      'method',
      },
    },
    }
  end
  },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "gruvbox" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
  rocks = {
    enabled = false
  },
})
