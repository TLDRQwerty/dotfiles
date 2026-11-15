vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })

---@type CatppuccinOptions
local catppuccin_opts = {
	flavour = "auto",
	background = {
		light = "latte",
		dark = "mocha",
	},
}
require("catppuccin").setup(catppuccin_opts)

vim.cmd.colorscheme("catppuccin-nvim")
