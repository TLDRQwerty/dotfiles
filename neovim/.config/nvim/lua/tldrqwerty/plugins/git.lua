vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.diff" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/gitlinker.nvim" },
})

require("gitsigns").setup()
require("gitlinker").setup()

local mini_diff_opts = {
	view = {
		-- show whole reference part above whole buffer part, as in `git diff`
		overlay_style = "hunk",
	},
	mappings = {
		-- same keymaps as codediff.nvim
		goto_next = "]c",
		goto_prev = "[c",
	},
}
require("mini.diff").setup(mini_diff_opts)
