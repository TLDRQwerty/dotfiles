local map = function(mode, key, cmd) return vim.api.nvim_set_keymap(mode, key, cmd, { noremap = false }) end

vim.g.mapleader = ' ';

vim.g.swap = false;
vim.g.backup = false;
vim.g.mouse = 'a';

-- not sure if working
vim.g.splitright = true;
vim.g.splitbelow = true;

-- Use CRTL-T h,j,k,l to move between tabs
map('n', '<C-t>l', ':tabr<CR>')
map('n', '<C-t>j', ':tabl<CR>')
map('n', '<C-t>h', ':tabp<CR>')
map('n', '<C-t>k', ':tabn<CR>')

-- Easy write and quit
map('n', '<leader>w', ':w<CR>');
map('n', '<leader>q', ':q<CR>');

-- Show highlight on yank
vim.api.nvim_command [[
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({})
]]

vim.wo.number = true;
vim.wo.relativenumber = true;

vim.o.expandtab = false;
vim.o.termguicolors = true;
vim.o.shiftwidth = 2;
vim.o.tabstop = 2;
vim.o.smarttab = true;
vim.o.listchars = 'trail:-,tab:· ,eol:¬'

vim.wo.list = true;
vim.wo.cursorline = true;
vim.wo.colorcolumn = '120';

map('i', 'jj', '<esc>')

map('n', 'j', 'gj');
map('n', 'k', 'gk');

map('n', '<C-t>c', ':nohl<CR>')
