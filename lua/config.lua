vim.opt.hidden = true                       -- Required to keep multiple buffers open multiple buffers
vim.opt.wrap = false                        -- Display long lines as just one line
vim.opt.encoding = "utf-8"                  -- The encoding displayed
vim.opt.fileencoding = "utf-8"              -- The encoding written to file
vim.opt.ruler = true                        -- Show the cursor position all the time
vim.opt.cmdheight = 1                       -- More space for displaying messages
vim.opt.iskeyword = vim.opt.iskeyword + "-" -- treat dash separated words as a word text object"
vim.opt.mouse= "a"                          -- Enable your mouse
vim.opt.splitbelow  = true                  -- Horizontal splits will automatically be below
vim.opt.splitright  = true                  -- Vertical splits will automatically be to the right
vim.opt.tabstop = 4                         -- Insert 2 spaces for a tab
vim.opt.shiftwidth = 4                      -- Change the number of space characters inserted for indentation
vim.opt.smarttab = true                     -- Makes tabbing smarter will realize you have 2 vs 4
vim.opt.shortmess = vim.opt.shortmess + "c" -- Don't pass messages to |ins-completion-menu|.
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true                  -- Makes indenting smart
vim.opt.autoindent = true                   -- Good auto indent
vim.opt.laststatus = 2                      -- Always display the status line
vim.opt.number = true                       -- Line numbers
vim.opt.relativenumber = true               -- Relative line numbers
vim.opt.cursorline = true                   -- Enable highlighting of the current line
vim.opt.background = "dark"                 -- tell vim what the background color looks like
vim.opt.showtabline = 2                     -- Always show tabs
vim.opt.showmode = false                    -- We don't need to see things like -- INSERT -- anymore
vim.opt.backup = false                      -- This is recommended by coc
vim.opt.writebackup = false                 -- This is recommended by coc
vim.opt.updatetime = 300                    -- Faster completion
vim.opt.timeoutlen = 500                    -- By default timeoutlen is 1000 ms
vim.opt.clipboard = "unnamedplus"           -- Copy paste between vim and everything else
vim.opt.autochdir = true                    -- Your working directory will always be the same as your working directory44
vim.opt.wrap = true
vim.opt.listchars = "tab:>-,trail:~,extends:>,precedes:<,space:·"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.list = true

vim.cmd([[
	autocmd TermOpen * setlocal nonumber norelativenumber
]])
