vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.diff" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/ruifm/gitlinker.nvim" },
})

require("gitsigns").setup()
require("gitlinker").setup()

local mini_diff_opts = {
	view = {
		overlay_style = "hunk",
	},
}
require("mini.diff").setup(mini_diff_opts)
