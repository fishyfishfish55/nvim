return {
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
}
