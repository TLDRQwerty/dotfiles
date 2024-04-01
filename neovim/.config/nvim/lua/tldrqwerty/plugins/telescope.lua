return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.6',
	dependencies = {
		'nvim-lua/plenary.nvim',
		"nvim-telescope/telescope-github.nvim",
		'pwntester/octo.nvim',
	},
	keys = {
		{ "<leader>fF", "<cmd>Telescope find_files<cr>" },
		{ "<leader>ff", "<cmd>Telescope git_files<cr>" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
	},
	opts = {},
	config = function(_, opts)
		require('telescope').setup(opts)

		if vim.fn.executable('gh') then
			require('telescope').load_extension('gh')
			require('telescope').load_extension('octo')
		end
	end
}
