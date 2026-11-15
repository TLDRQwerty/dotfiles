vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
})

---@type oil.setupOpts
local oil_opts = {
	keymaps = {
		["q"] = { "actions.close", mode = "n" },
	},
	columns = {
		"icon",
		{ "permissions", highlight = "Type" },
		{ "size", highlight = "String" },
		{ "mtime", highlight = "Keyword" },
	},
	view_options = {
		show_hidden = true,
	},
	preview_win = {
		update_on_cursor_moved = true,
	},
	float = {
		border = "rounded",
		win_options = {
			winblend = 0,
		},
		max_width = 200,
	},
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_changes = true,
	},
}
require("oil").setup(oil_opts)
vim.keymap.set("n", "_", "<CMD>Oil<CR>", { desc = "Open parent directory" })

---@type YaziConfig
local yazi_opts = {}
require("yazi").setup(yazi_opts)
vim.keymap.set({ "n", "v" }, "-", "<CMD>Yazi<CR>", { desc = "Open Yazi in current dir" })
