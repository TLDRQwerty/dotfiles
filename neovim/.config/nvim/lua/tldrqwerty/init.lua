print('loaded')

vim.g.mapleader = ' ';

vim.api.nvim_set_keymap('i', 'jj', '<esc>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-c>', ':nohl<cr>', { silent = true })

vim.api.nvim_set_keymap('n', '<leader>w', ':w<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<cr>', { silent = true })

vim.api.nvim_set_keymap('n', '<C-t>l', ':tabr<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-t>h', ':tabl<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-t>j', ':tabp<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-t>k', ':tabn<cr>', { silent = true })

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = false
vim.opt.expandtab = true

vim.o.swapfile = false

vim.opt.fillchars = { eob = "~" }

vim.o.completeopt="menuone,noinsert,noselect"

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("trail:-")

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.o.number = true
vim.o.relativenumber = true

require('tldrqwerty.plugins')
require('tldrqwerty.lsp')
