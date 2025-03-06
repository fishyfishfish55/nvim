return {
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup {
        event = 'LspAttach',
      }
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',   -- optional
    }
  },
}
