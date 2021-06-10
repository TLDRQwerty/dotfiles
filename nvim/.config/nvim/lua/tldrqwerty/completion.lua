vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true });
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true });

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noinsert,noselect";

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c";

-- Chain completion list
vim.g.completion_chain_complete_list = {
	default = {
		default = {
			{ complete_items = { 'lsp', 'path', 'ts' }},
			{ mode = '<c-p>'},
			{ mode = '<c-n>'}},
		comment = {},
		string = { { complete_items = { 'path' } } }
	}
};

vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" };
vim.g.compeltion_trigger_on_delete = 1;

