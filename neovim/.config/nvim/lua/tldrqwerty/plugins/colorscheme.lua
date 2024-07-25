return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"catppuccin/nvim",
		as ="catppuccin",
		lazy = false,
		priority = 1000,
		opts = {},
		{
			"zootedb0t/citruszest.nvim",
			lazy = false,
			priority = 1000,
		},
		{
			'wadackel/vim-dogrun',
			lazy = false,
			priority = 1000,
		},
		{
			'scottmckendry/cyberdream.nvim',
			lazy = false,
			priority = 1000,
		}
	}
}
