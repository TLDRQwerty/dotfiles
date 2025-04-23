vim.opt.fillchars = { eob = "~" }

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("trail:-")

vim.o.swapfile = false

vim.o.number = true
vim.o.relativenumber = true

vim.o.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.inccommand = "nosplit"
