local opt = vim.opt
vim.o.breakindent = true
vim.g.mapleader = ":"
opt.ignorecase = true
opt.mouse = "a"
opt.autoindent = true
opt.hlsearch = true
opt.number = true
opt.cursorline = true
opt.laststatus = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.cursorcolumn = true
opt.ruler = true
opt.syntax = "on"
opt.smartcase = true
opt.ignorecase = true
opt.list = true
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
vim.opt.termguicolors = true
vim.opt.clipboard:prepend {"unnamedplus"}
vim.cmd[[colorscheme tokyonight-day]]
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Mapping
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end
map('', '<C-D>', ':Telescope find_files<CR>')
map('', '<C-F>', ':Telescope grep_string<CR>')
map('', '<C-X>', ':NvimTreeToggle<CR>')

-- Base64 encode/decode shortcuts
map('v', '<leader>e64', ':B64Encode<CR>')
map('v', '<leader>d64', ':B64Decode<CR>')

require("nvim-tree").setup()
