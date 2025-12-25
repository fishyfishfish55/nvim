-- Leader keys are defined in lazy.lua
-- so that plugins are able to work with them.
-- Consider splitting keymap config into two files, keymaps_preload and keymaps

local wk = require("which-key")
 wk.add({
   { "<leader>f", group = "find" },
   { mode = "n",
     { "<leader>ff", ":Telescope find_files<cr>", desc = "files" },
     { "<leader>fg", ":Telescope live_grep<cr>", desc = "grep" },
   },

   { "<leader>b", group = "buffers" },
   { mode = "n",
     { "<leader>bb", ":Telescope buffers<cr>", desc = "buffers" },
     { "<leader>bn", ":bnext<CR>", desc = "next buffer" },
     { "<leader>bp", ":bprev<CR>", desc = "prev buffer" },
     { "<leader>bd", ":bdelete<CR>", desc = "delete buffer" },
   },

   { "<leader>p", '"*p', desc = "Paste from System Clipboard" },
   { "<leader>y", '"*y', desc = "Copy to System Clipboard" },
 })

