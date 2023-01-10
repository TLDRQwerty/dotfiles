local function setup()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>fF", builtin.find_files, {})
	vim.keymap.set("n", "<leader>ff", builtin.git_files, {})
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
	vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

	vim.keymap.set("n", "<leader>fls", builtin.lsp_document_symbols, {})
	vim.keymap.set("n", "<leader>flw", builtin.lsp_workspace_symbols, {})
	vim.keymap.set("n", "<leader>fld", builtin.diagnostics, {})
	vim.keymap.set("n", "<leader>flr", builtin.lsp_references, {})
	vim.keymap.set("n", "<leader>fld", builtin.lsp_definitions, {})

	vim.keymap.set("n", "<leader>fgb", builtin.git_branches, {})
	vim.keymap.set("n", "<leader>fgc", builtin.git_commits, {})
	vim.keymap.set("n", "<leader>fgbc", builtin.git_bcommits, {})

	vim.keymap.set("n", "<leader>fgi", require("telescope").extensions.gh.issues, {})
	vim.keymap.set("n", "<leader>fgr", require("telescope").extensions.gh.pull_request, {})
end

local function config()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local file_browser_actions = telescope.extensions.file_browser.actions

	telescope.setup({
		defaults = {
			layout_strategy = "flex",
			layout_config = { anchor = "N" },
			scroll_strategy = "cycle",
			theme = require("telescope.themes").get_dropdown({ layout_config = { prompt_position = "top" } }),
			initial_mode = "insert",
			mappings = {
				i = {
					["<ESC>"] = actions.close,
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown({ layout_config = { prompt_position = "top" } }),
			},
			heading = { treesitter = true },
			file_browser = {
				hijack_netwrw = true,
				hidden = true,
				mappings = {
					i = {
						["<c-n>"] = file_browser_actions.create,
						["<c-r>"] = file_browser_actions.rename,
						["<c-h>"] = file_browser_actions.toggle_hidden,
						["<c-x>"] = file_browser_actions.remove,
						["<c-p>"] = file_browser_actions.move,
						["<c-y>"] = file_browser_actions.copy,
						["<c-a>"] = file_browser_actions.select_all,
					},
				},
			},
		},
		pickers = {
			buffers = {
				ignore_current_buffer = true,
				-- sort_mru = true,
				sort_lastused = true,
				previewer = false,
			},
		},
	})

	telescope.load_extension("fzf")
	telescope.load_extension("ui-select")
	telescope.load_extension("notify")
	telescope.load_extension("heading")
	telescope.load_extension("file_browser")
	telescope.load_extension("gh")
end

return { config = config, setup = setup }
