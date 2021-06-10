local map = function(mode, key, cmd, options) 
	if options == nil then
		options = { noremap = false };
	end
	return vim.api.nvim_set_keymap(mode, key, cmd, options) 
end

vim.g.mapleader = ' ';

vim.api.nvim_command('set noswapfile');
vim.api.nvim_command('set nobackup');

-- not sure if working
vim.g.splitright = true;
vim.g.splitbelow = true;

-- Use CRTL-T h,j,k,l to move between tabs
map('n', '<C-t>l', ':tabr<CR>')
map('n', '<C-t>j', ':tabl<CR>')
map('n', '<C-t>h', ':tabp<CR>')
map('n', '<C-t>l', ':tabn<CR>')

-- Easy write and quit
map('n', '<leader>w', ':w<CR>');
map('n', '<leader>q', ':q<CR>');

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

map('i', 'jj', '<esc>')

map('n', 'j', 'gj');
map('n', 'k', 'gk');

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
