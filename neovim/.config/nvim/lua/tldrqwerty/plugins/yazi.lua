return {
	"mikavilpas/yazi.nvim",
	lazy = true,
	cmd = { "Yazi" },
	keys = {
		{
			"<leader>-",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory" ,
		},
		{
			'<c-up>',
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	opts = {
		open_for_directories = false,
		keymaps = {
			show_help = '<f1>',
		},
	},
}