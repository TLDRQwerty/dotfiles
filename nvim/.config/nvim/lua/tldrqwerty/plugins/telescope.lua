local mapper = require('tldrqwerty.utils').mapper

require('telescope').setup{
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter =  require'telescope.sorters'.get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
		shorten_path = true,
		winblend = 0,
		border = {},
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		color_devicons = true,
		use_less = true,
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
	}
};

mapper('n', '<leader>ff', ':Telescope find_files');
mapper('n', '<leader>fF', ':Telescope git_files');
mapper('n', '<leader>fg', ':Telescope live_grep');
mapper('n', '<leader>fb', ':Telescope buffers');
mapper('n', '<leader>fls', ':Telescope lsp_document_symbols');
mapper('n', '<leader>flc', ':Telescope lsp_code_actions');
mapper('n', '<leader>flw', ':Telescope lsp_workspace_symbols');

mapper('n', '<leader>gb', ':Telescope git_branches');
mapper('n', '<leader>gc', ':Telescope git_commits');
mapper('n', '<leader>gbc', ':Telescope git_bcommits');
mapper('n', '<leader>gs', ':Telescope git_status');
