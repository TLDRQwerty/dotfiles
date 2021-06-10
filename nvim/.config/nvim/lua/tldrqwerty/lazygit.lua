require('lazygit')
local map = function(mode, key, cmd, options) 
	if options == nil then
		options = { noremap = false };
	end
	return vim.api.nvim_set_keymap(mode, key, cmd, options) 
end

map('n', '<leader>lg', ':LazyGit<CR>');
