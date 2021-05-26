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
		prompt_position = "bottom",
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_defaults = {
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
		width = 0.75,
		preview_cutoff = 120,
		results_height = 1,
		results_width = 0.8,
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
}

mapper('n', '<leader>ff', 'require("telescope.builtin").find_files()');
mapper('n', '<leader>fF', 'require("telescope.builtin").git_files()');
mapper('n', '<leader>fg', 'require("telescope.builtin").live_grep()');
mapper('n', '<leader>fb', 'require("telescope.builtin").buffers()');
mapper('n', '<leader>fls', 'require("telescope.builtin").lsp_document_symbols()');
mapper('n', '<leader>flc', 'require("telescope.builtin").lsp_code_actions()');
mapper('n', '<leader>flw', 'require("telescope.builtin").lsp_workspace_symbols()');

mapper('n', '<leader>gb', 'require("telescope.builtin").git_branches()');
mapper('n', '<leader>gc', 'require("telescope.builtin").git_commits()');
mapper('n', '<leader>gbc', 'require("telescope.builtin").git_bcommits()');
mapper('n', '<leader>gs', 'require("telescope.builtin").git_status()');
