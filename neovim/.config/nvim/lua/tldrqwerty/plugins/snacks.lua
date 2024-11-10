return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = { enabled = true },
		notifier = { enabled = false },
	},
	keys = {
		{ "<leader>lg", function() require("snacks").lazygit.open() end, desc = "Open Lazygit" }
	}
}
