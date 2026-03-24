return {
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "folke/snacks.nvim", lazy = true },
		},
		keys = {
			{
				"<leader>-",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		opts = function()
			require("telescope").load_extension("gh")
			require("telescope").load_extension("fzf")
		end,
		dependencies = {
			{ "nvim-telescope/telescope-github.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
			},
		},
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fF",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Find buffers",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Help tags",
			},

			{
				"<leader>flr",
				function()
					require("telescope.builtin").lsp_references()
				end,
				desc = "LSP references",
			},
			{
				"<leader>fld",
				function()
					require("telescope.builtin").lsp_definitions()
				end,
				desc = "LSP definitions",
			},
			{
				"<leader>fli",
				function()
					require("telescope.builtin").lsp_implementations()
				end,
				desc = "LSP implementations",
			},
			{
				"<leader>fls",
				function()
					require("telescope.builtin").lsp_document_symbols()
				end,
				desc = "LSP document symbols",
			},
			{
				"<leader>flc",
				function()
					require("telescope.builtin").lsp_code_actions()
				end,
				desc = "LSP code actions",
			},

			{
				"<leader>fgi",
				function()
					require("telescope").extensions.gh.issues()
				end,
				desc = "Find GitHub issues",
			},
			{
				"<leader>fgp",
				function()
					require("telescope").extensions.gh.pull_request()
				end,
				desc = "Find GitHub PRs",
			},
		},
	},
}
