return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{
				"pwntester/octo.nvim",
				dependencies = { "plenary.nvim","nvim-tree/nvim-web-devicons" },
				opts = {},
			},
			{
				"nvim-telescope/telescope-github.nvim",
				dependencies = { "plenary.nvim" },
				opts = {},
			},
		},
		lazy = true,
		cmd = { "Telescope" },
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Telescope git find files",
			},
			{
				"<leader>fF",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Telescope find files",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Telescope live grep",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Telescope find buffers",
			},
			{
				"<leader>fls",
				function()
					require("telescope.builtin").lsp_document_symbols()
				end,
				desc = "Telescope lsp document symbols",
			},
			{
				"<leader>fli",
				function()
					require("telescope.builtin").lsp_implementations()
				end,
				desc = "Telescope lsp implementations",
			},
			{
				"<leader>flr",
				function()
					require("telescope.builtin").lsp_references()
				end,
				desc = "Telescope lsp references",
			},
			{
				"<leader>fld",
				function()
					require("telescope.builtin").lsp_definitions()
				end,
				desc = "Telescope lsp definitions",
			},
			{
				"<leader>flc",
				function()
					require("telescope.builtin").lsp_code_actions()
				end,
				desc = "Telescope lsp code actions",
			},
			{
				"<leader>flw",
				function()
					require("telescope.builtin").lsp_workspace_symbols()
				end,
				desc = "Telescope lsp workspace symbols",
			},
			{
				"<leader>flg",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols()
				end,
				desc = "Telescope lsp dynamic workspace symbols",
			},
			{
				"<leader>flt",
				function()
					require("telescope.builtin").lsp_type_definitions()
				end,
				desc = "Telescope lsp type definitions",
			},
		},
		setup = function()
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("octo")
			require("telescope").load_extension("gh")
		end,
	},
}
