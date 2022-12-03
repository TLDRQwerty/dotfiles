local function setup()
	vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', { silent = true });
	vim.api.nvim_set_keymap('n', '<leader>fF', ':Telescope git_files<cr>', { silent = true });
	vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', { silent = true });
	vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<cr>', { silent = true });

	vim.api.nvim_set_keymap('n', '<leader>fls', ':Telescope lsp_document_symbols<cr>', { silent = true });
	vim.api.nvim_set_keymap('n', '<leader>flc', ':Telescope lsp_code_actions<cr>', { silent = true });
	vim.api.nvim_set_keymap('n', '<leader>flw', ':Telescope lsp_workspace_symbols<cr>', { silent = true });

	vim.api.nvim_set_keymap('n', '<leader>fgb', ':Telescope git_branches<cr>', { silent = true });
	vim.api.nvim_set_keymap('n', '<leader>fgc', ':Telescope git_commits<cr>', { silent = true });
	vim.api.nvim_set_keymap('n', '<leader>fgbc', ':Telescope git_bcommits<cr>', { silent = true });
	vim.api.nvim_set_keymap('n', '<leader>fgs', ':Telescope git_status<cr>', { silent = true });
end

local function config()
	local telescope = require('telescope')
	local finders = require('telescope.builtin')
	local actions = require('telescope.actions')
	telescope.setup({
		defaults = {
			initial_mode = 'insert',
			mappings = {
				i = {
					['<ESC>'] = actions.close,
					['<C-j>'] = actions.move_selection_next,
					['<C-k>'] = actions.move_selection_previous,
				}
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,                    -- false will only do exact matching
				override_generic_sorter = true,  -- override the generic sorter
				override_file_sorter = true,     -- override the file sorter
				case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			}
		}
	})

	telescope.load_extension('fzf')
	telescope.load_extension('gh')
end

return { config = config, setup = setup }
