require('nvim-treesitter.configs').setup {
	ensure_installed = 'maintained',
	ignore_install = { 'php' },
	highlight = {
		enable = true,
	},
	indent = {
		enable = false,
		disable = { "javascriptreact", "javascript" }
	}
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.typescript.used_by = "javascriptreact"

vim.wo.foldmethod = 'expr';
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()';
vim.wo.foldlevel = 20;
