require("kuroashi.remap")
require("kuroashi.lazy")
require("kuroashi.lsp-init")
require("kuroashi.autocmds")

-- set to true if have nerd font in terminal
vim.g.have_nerd_font = true
-- sync clipboard between OS and Neovim


-- personalize line break
vim.opt.linebreak = true
vim.opt.breakat = '\t;,!?'

-- save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- gui colors
vim.opt.termguicolors = true
-- vim.opt.colorcolumn = "80"

-- keep signcolumn on by default
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

-- decrease update time

vim.opt.updatetime = 50


vim.opt.timeoutlen = 500

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

--shiftwidth
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- smartindent
vim.opt.smartindent = true

-- linewrap
vim.opt.wrap = false

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true

-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldcolumn = '0'
vim.opt.foldtext = ''
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 2

vim.opt.scrolloff = 10

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.g.netrw_liststyle = 3

--- set to show line number
vim.opt.nu = true

-- relative numbers
vim.opt.relativenumber = true

-- clipboard
vim.opt.clipboard = "unnamedplus"
