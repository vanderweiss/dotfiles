local opt = vim.opt

opt.number = true
opt.autoindent = true
opt.smarttab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.mouse = 'r'
opt.fillchars = 'eob: '
opt.encoding = 'UTF-8'
opt.clipboard = 'unnamedplus'

vim.g.signcolum = 'no'
vim.g.updatetime = 300
vim.g.nobackup = true
vim.g.nowritebackup = true

vim.cmd('highlight VertSplit cterm=NONE')
vim.cmd('hi! link SignColumn LineNr')
