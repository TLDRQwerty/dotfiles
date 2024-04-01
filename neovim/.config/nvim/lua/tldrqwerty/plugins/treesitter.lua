return {
	{
		"nvim-treesitter/nvim-treesitter",
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
			}
		},
		config = function(_, opts)
			local configs = require("nvim-treesitter.configs")

			configs.setup(opts)
		end
	}
}
