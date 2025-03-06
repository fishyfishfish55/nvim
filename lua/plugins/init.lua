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
