require("config")
require("lsp")
require("plugins")
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require("dashboard-setup")
require("nvim-tree").setup()
require('gitsigns-setup')
require("treesitter-setup")
require("lualine-setup")
require("tokyonight-setup")
require("nvim-cmp-setup")
