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

vim.cmd('set cursorline cursorlineopt=number')
vim.cmd('colorscheme vimdark')

