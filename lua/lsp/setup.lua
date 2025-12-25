local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Bootstrap Mason
mason.setup()
mason_lspconfig.setup({
  ensure_installed = { "pyright", "rust_analyzer" },
})

-- Load language modules dynamically
local function load_lang(ft)
  local ok, lang = pcall(require, "langs." .. ft)
  if not ok then return end

  if lang.lsp then
    lspconfig[lang.lsp.server].setup(lang.lsp.settings or {})
  end
end

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    load_lang(args.match)
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local buf = ev.buf
    local wk = require("which-key")

    wk.add({
     { "<leader>l", group = "lsp" },
     { mode = "n"
       { "<leader>ld", vim.lsp.buf.definition, desc = "defenition" },
       { "<leader>lr", vim.lsp.buf.references, desc = "references" },
       { "<leader>lh", vim.lsp.buf.hover, desc = "hover" },
       { "<leader>lR", vim.lsp.buf.rename, desc = "rename" },
       { "<leader>la", vim.lsp.buf.code_action, desc = "code action" },
       { "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, desc = "format" },
     }
    })
  end,
})

