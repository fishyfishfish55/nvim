return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        -- Copy-paste
        { "<leader>p", '"*p', desc = "Paste from System Clipboard" },
        { "<leader>y", '"*y', desc = "Copy to System Clipboard" },
        -- Telescope
        { "<leader>f", ":Telescope find_files<cr>", desc = "File picker", mode = "n"},
        { "<leader>b", ":Telescope buffers<cr>", desc = "Buffers", mode = "n"},
        { "<leader>g", ":Telescope live_grep<cr>", desc = "Find in files", mode = "n"},
        { "<leader>u", ":Telescope undo<cr>", desc = "Undo tree", mode = "n"},
        -- LSP
        { "<leader>l", group = "LSP" },
        { "<leader>ll", ":Lspsaga finder<cr>", desc = "See references", mode = "n"},
        { "<leader>lr", ":Lspsaga rename ++project<cr>", desc = "Rename symbol", mode = "n"},
        { "<leader>la", ":Lspsaga code_action<cr>", desc = "Code action", mode = "n"},
        { "<leader>lp", ":Lspsaga peek_definition<cr>", desc = "Peek defenition", mode = "n"},
        { "<leader>lP", ":Lspsaga peek_type_definition<cr>", desc = "Peek type defenition", mode = "n"},
        { "gd", ":Lspsaga goto_definition<cr>", desc = "Go to defenition", mode = "n"},
        { "gD", ":Lspsaga goto_type_definition<cr>", desc = "Go to type defenition", mode = "n"},
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
  'johmsalas/text-case.nvim',
  config = function()
    require('textcase').setup {}
    require('telescope').load_extension('textcase')
  end
},
}
