local M = {}

M.lsp = {
  server = "pyright",
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
      },
      venvPath = vim.fn.getcwd() .. "/.venv",
    },
  },
}

M.formatters = {
  "black",
}

M.linters = {
  "ruff",
}

return M

