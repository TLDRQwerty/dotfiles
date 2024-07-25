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
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		-- 👇 in this section, choose your own keymappings!
		keys = {
			{
				"<leader>-",
				function()
					require("yazi").yazi()
				end,
				desc = "Open the file manager",
			},
			{
				-- Open in the current working directory
				"<leader>_",
				function()
					require("yazi").yazi(nil, vim.fn.getcwd())
				end,
				desc = "Open the file manager in nvim's working directory",
			},
			{
				'<c-up>',
				function()
					-- NOTE: requires a version of yazi that includes
					-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
					require('yazi').toggle()
				end,
				desc = "Resume the last yazi session",
			},
		},
		---@type YaziConfig
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
		}
	},
	{
		"kdheepak/lazygit.nvim",
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
		'MeanderingProgrammer/markdown.nvim',
		name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		opts = {},
	}
}
