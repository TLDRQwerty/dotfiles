return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects"
		},
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"astro",
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
			auto_install = true,
			highlight = {
				enable = true,

				additional_vim_regex_highlighting = { "php" },
			},

			textobjects = {
				lsp_interop = {
					enable = true,
					border = 'none',
					floating_preview_opts = {},
					peek_definition_code = {
						["<leader>df"] = "@function.outer",
						["<leader>dF"] = "@class.outer",
					},
				},
			},
		},
		config = function(_, opts)
			local configs = require("nvim-treesitter.configs")

			configs.setup(opts)
		end
	}
}
