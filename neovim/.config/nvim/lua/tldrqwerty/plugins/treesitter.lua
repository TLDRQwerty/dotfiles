return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = "all",
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
