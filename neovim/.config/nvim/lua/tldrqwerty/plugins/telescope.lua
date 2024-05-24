return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.6',
	dependencies = {
		'nvim-lua/plenary.nvim',
		"nvim-telescope/telescope-github.nvim",
		'pwntester/octo.nvim',
	},
	keys = {
		{ "<leader>fF",  "<cmd>Telescope find_files<cr>" },
		{ "<leader>ff",  "<cmd>Telescope git_files<cr>" },
		{ "<leader>fg",  "<cmd>Telescope live_grep<cr>" },
		{ "<leader>fb",  "<cmd>Telescope buffers<cr>" },
		{ "<leader>fh",  "<cmd>Telescope help_tags<cr>" },

		{ "<leader>flr", "<cmd>Telescope lsp_references<cr>" },
		{ "<leader>fld", "<cmd>Telescope lsp_definitions<cr>" },
		{ "<leader>flD", "<cmd>Telescope lsp_declorations<cr>" },
		{ "<leader>fli", "<cmd>Telescope lsp_implementations<cr>" },
		{ "<leader>fls", "<cmd>Telescope lsp_document_symbols<cr>" },
	},
	opts = {
		defaults = {
			layout_config = {
				preview_cutoff = 10,
			},
		}
	},
	config = function(_, opts)
		require('telescope').setup(opts)

		if vim.fn.executable('gh') then
			require('telescope').load_extension('gh')
			require('telescope').load_extension('octo')
		end
	end
}
