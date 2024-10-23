return {
	{
		"aserowy/tmux.nvim",
		opts = {}
	},
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>-",
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				-- NOTE: this requires a version of yazi that includes
				-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
				'<c-up>',
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
		},
	},
	{
		"echasnovski/mini.comment",
		opts = {},
		dependencies = {
			{
				'JoosepAlviste/nvim-ts-context-commentstring',
				opts = {
					enable_autocmd = false,
				},
			}
		}
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {}
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
		opts = {},
	}
}
