local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.used_by = { "typescriptreact", "javascript", "javascriptreact" }

require('nvim-treesitter.configs').setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = {
		enable = true,
		disabled_filetypes = { "javascript", "javascriptreact" }
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	playground = {
		enable = true,
		updatetime = 25,
		persist_queries = false,
	}
})

