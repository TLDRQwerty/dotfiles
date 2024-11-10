return {
	"epwalsh/obsidian.nvim",
	lazy = true,
	ft = { "markdown" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		ui = {
			enable = false,
		},
		workspaces = {
			{
				name = "personal",
				path = "~/vaults/personal",
			},
		},
	},
}
