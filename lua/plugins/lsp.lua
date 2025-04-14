return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").pyright.setup{}
      require("lspconfig").lua_ls.setup{}
      require("lspconfig").bashls.setup{}
      require("lspconfig").clangd.setup{}
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup {
        event = 'LspAttach',
      }
      vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc')
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',   -- optional
    }
  },
}
