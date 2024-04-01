return {
	{
		"aserowy/tmux.nvim",
		opts = {}
	},
	{
		"lmburns/lf.nvim",
		opts = {},
		config = function(_, opts)
			vim.g.lf_newtrw = 1
			require("lf").setup(opts)
		end,
		dependencies = {
			"akinsho/toggleterm.nvim"
		},
		keys = {
			{ "<leader>lf", "<cmd>Lf<cr>" },
		},
	},
	{
		"kdheepak/lazygit.nvim",
		opts = {},
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
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
	}
}
