return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		dependencies = {
			"nvim-treesitter/playground",
		},
		opts = {
			ensure_installed = "all",
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		},
	}
}
