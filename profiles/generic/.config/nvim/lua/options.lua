local opt = vim.opt

opt.number = true
opt.autoindent = true
opt.smarttab = true
opt.termguicolors = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.updatetime = 100
opt.mouse = 'r'
opt.fillchars = 'eob: '
opt.encoding = 'UTF-8'
opt.clipboard = 'unnamedplus' 

vim.g.signcolum = 'no'
vim.g.nobackup = true
vim.g.nowritebackup = true

vim.cmd('set noshowmode')
vim.cmd('set cursorline cursorlineopt=number')

local keymap = vim.api.nvim_set_keymap

keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

local opts = { noremap = true }

keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
