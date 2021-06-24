vim.g.mapleader = ' ';

vim.api.nvim_command('set noswapfile');
vim.api.nvim_command('set nobackup');

-- not sure if working
vim.g.splitright = true;
vim.g.splitbelow = true;

-- Doesn't work with map and idk why
vim.api.nvim_command('map <C-c> :nohl<cr>');

-- Show highlight on yank
vim.api.nvim_command [[
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({})
]]

vim.wo.number = true;

vim.o.expandtab = false;
vim.o.termguicolors = true;
vim.o.shiftwidth = 2;
vim.o.tabstop = 2;
vim.o.smarttab = true;
vim.o.listchars = 'trail:-,tab:· ,eol:¬'
vim.o.mouse = 'a'

vim.api.nvim_command('set splitright splitbelow')

vim.api.nvim_command('set inccommand=split')

vim.wo.list = true;
vim.wo.cursorline = true;
vim.wo.colorcolumn = '120';

vim.api.nvim_command("set ignorecase incsearch smartcase")

vim.api.nvim_command("set clipboard=unnamedplus")

-- Set numbers dependent on mode
vim.api.nvim_command(":augroup numbertoggle")
vim.api.nvim_command(":  autocmd!")
vim.api.nvim_command(":  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber")
vim.api.nvim_command(":  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber")
vim.api.nvim_command(":augroup END")

vim.api.nvim_command("autocmd BufNewFile,BufRead,BufEnter *.js set filetype=javascriptreact")

vim.g.javascript_plugin_flow = 1;
