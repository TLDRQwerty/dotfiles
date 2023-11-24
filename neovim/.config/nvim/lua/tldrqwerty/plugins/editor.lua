return {
	{
		"lewis6991/gitsigns.nvim",
		cmd = "Gitsigns",
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns
				print(vim.inspect(gs))

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			end,
		},
	},
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
	},
	-- in your project and loads them into a browsable list.
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		config = true,
	},

	{
		"lmburns/lf.nvim",
		dependencies = { "toggleterm.nvim" },
		opts = {
			escape_quit = false,
			border = "rounded",
		},
		keys = {
			{
				"<leader>lf",
				function()
					require("lf").start({ border = "rounded" })
				end,
			},
		},
	},

	{
		"aserowy/tmux.nvim",
		opts = {
			copy_sync = {
				enable = true,
			},
			navigation = {
				enable_default_keybindings = true,
			},
			resize = {
				enable_default_keybindings = true,
			},
		},
	},

	{
		"akinsho/toggleterm.nvim",
		opts = {},
		keys = {
			{
				"<leader>lg",
				function()
					local Terminal = require("toggleterm.terminal").Terminal
					local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
					function _lazygit_toggle()
						lazygit:toggle()
					end

					_lazygit_toggle()
				end,
			},
			{
				"<leader>tf",
				function()
					local Terminal = require("toggleterm.terminal").Terminal
					local float_terminal = Terminal:new({
						direction = "float",
					})
					function _float_terminal_toggle()
						float_terminal:toggle()
					end

					_float_terminal_toggle()
				end,
			},
			{
				"<leader>tt",
				function()
					local Terminal = require("toggleterm.terminal").Terminal
					local tab_terminal = Terminal:new({
						direction = "tab",
					})
					function _tab_terminal_toggle()
						tab_terminal:toggle()
					end

					_tab_terminal_toggle()
				end,
			},
			{
				"<leader>tv",
				function()
					local Terminal = require("toggleterm.terminal").Terminal
					local vertical_terminal = Terminal:new({
						direction = "vertical",
					})
					function _vertical_terminal_toggle()
						vertical_terminal:toggle()
					end

					_vertical_terminal_toggle()
				end,
			},
			{
				"<leader>ts",
				function()
					local Terminal = require("toggleterm.terminal").Terminal
					local terminal = Terminal:new({})
					function _horizontal_terminal_toggle()
						terminal:toggle()
					end

					_horizontal_terminal_toggle()
				end,
			},
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		enabled = false,
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						search = {
							mode = function(str)
								return "\\<" .. str
							end,
						},
					})
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Flash Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
}
