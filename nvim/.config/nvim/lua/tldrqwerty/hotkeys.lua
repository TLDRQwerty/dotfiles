local mapper = require('tldrqwerty.utils').mapper

-- Use CRTL-T h,j,k,l to move between tabs
mapper('n', '<C-t>l', ':tabr')
mapper('n', '<C-t>j', ':tabl')
mapper('n', '<C-t>h', ':tabp')
mapper('n', '<C-t>l', ':tabn')

-- Arrow resize
mapper('n', '<C-Left>', ':vertical resize +2')
mapper('n', '<C-Right>', ':vertical resize -2')
mapper('n', '<C-Up>', ':resize +2')
mapper('n', '<C-Down>', ':resize -2')

-- Easy write and quit
mapper('n', '<leader>w', ':w');
mapper('n', '<leader>q', ':q');

vim.api.nvim_set_keymap('i', 'jj', '<esc>', { noremap = true }) 
