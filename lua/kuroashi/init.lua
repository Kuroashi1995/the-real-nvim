require("kuroashi.remap")
require("kuroashi.lazy")
require("kuroashi.lsp-init")
require("kuroashi.autocmds")

-- helps with spaces in CMD
vim.opt.shellxquote = ""
-- Obtiene la ruta de datos de Neovim (donde Mason instala cosas)
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"

-- Agrega esa ruta al PATH de la sesión actual de Neovim
-- En Windows usamos ';' para separar rutas
vim.env.PATH = mason_bin .. ";" .. vim.env.PATH
-- windows shit config
if vim.fn.has("win32") == 1 then
  vim.o.shell = "cmd.exe"
  -- El flag /s es vital para que Windows respete las comillas en las rutas
  vim.o.shellcmdflag = "/s /c"
  vim.o.shellquote = ""
  vim.o.shellxquote = '"' 
end

-- force compiler in windows
if vim.loop.os_uname().sysname == "Windows_NT" then
  print("we on windows babyyy")
  require('nvim-treesitter.install').compilers = { "zig" }
end

-- set to true if have nerd font in terminal
vim.g.have_nerd_font = true
-- sync clipboard between OS and Neovim

-- personajjlize status line
vim.cmd [[
  highlight StatusLine guifg=#ffffff guibg=#005f87
  highlight StatusLineNC guifg=#888888 guibg=#6a1df0
]]

-- Add this to your statusline string logic
local function current_function()
  return require'nvim-treesitter'.statusline({
    indicator_size = 60,
    type_patterns = {'class', 'function', 'method'}
  })
end

-- change highlight
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2d3f76", blend = 10 })

-- personalize line break
vim.opt.linebreak = true
vim.opt.breakat = '\t;,!?'

-- save undo history
vim.opt.swapfile = false
vim.opt.backup = false

local undo_path = vim.fn.stdpath("cache") .. "/undo"
if vim.fn.isdirectory(undo_path) == 0 then
  vim.fn.mkdir(undo_path, "p")
end
vim.opt.undodir = undo_path
vim.opt.undofile = true

-- case-insensitive searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- gui colors
vim.opt.termguicolors = true
-- vim.opt.colorcolumn = "80"

-- keep signcolumn on by default
vim.opt.signcolumn = 'yes'
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
vim.opt.wrap = true

vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }
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
