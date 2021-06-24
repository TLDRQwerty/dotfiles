local eslint = require('diagnosticls-nvim.linters.eslint')
local prettier = require('diagnosticls-nvim.formatters.prettier')
local phpcs = require('diagnosticls-nvim.linters.phpcs')

require('diagnosticls-nvim').setup({
		['javascript'] = {
			linter = eslint,
			formatter = prettier
		},
		['javascriptreact'] = {
			linter = eslint,
			formatter = prettier
		},
		['php'] = {
			linter = phpcs
		}
	});
