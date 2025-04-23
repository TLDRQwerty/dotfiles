return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = "all",
			highlight = {
				enable = true,
				disable = function(lang, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 5000 end,
			},
		},
		config = function(_, opts)
			require('nvim-treesitter.configs').setup(opts)

			local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c", },
					branch = "main",
				},
				filetype = "blade",
			}
		end
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	}
}
