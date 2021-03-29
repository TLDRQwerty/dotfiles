local lspconfig = require('lspconfig');
local completion = require('completion');

local mapper = function(mode, key, cmd)
	vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. cmd .. "<CR>", { noremap = true, silent = true })
end

local lsp_attach = function(client)
	mapper('n', 'gD', 'vim.lsp.buf.declaration()')
	mapper('n', 'gd', 'vim.lsp.buf.definition()')
	mapper('n', 'K', 'vim.lsp.buf.hover()')
	mapper('n', 'gi', 'vim.lsp.buf.implementation()')
	mapper('n', '<c-s>', 'vim.lsp.buf.signature_help()')
	mapper('n', 'gTD', 'vim.lsp.buf.type_definition()')
	mapper('n', '<leader>rn', 'vim.lsp.buf.rename()')
	mapper('n', 'gr', 'vim.lsp.buf.references()')
	mapper('n', 'ca', 'vim.lsp.buf.code_action()')

	mapper('n', 'dn', 'vim.lsp.diagnostic.goto_next()')
	mapper('n', 'dp', 'vim.lsp.diagnostic.goto_prev()')
	mapper('n', 'do', 'vim.lsp.diagnostic.set_loclist()')
	mapper('n', '<leader>e', 'vim.lsp.diagnostic.show_line_diagnostics()')

	completion.on_attach(client)
end

lspconfig.vimls.setup{
	on_attach=lsp_attach
}

lspconfig.tsserver.setup{
	on_attach=lsp_attach,
	root_pattern=lspconfig.util.root_pattern('.tsconfig'),
	filetypes={"typescript", "typescriptreact"}
}

lspconfig.html.setup{
	on_attach=lsp_attach
}

lspconfig.texlab.setup{
	on_attach=lsp_attach
}

lspconfig.clangd.setup{
	on_attach=lsp_attach,
}

lspconfig.diagnosticls.setup{
	on_attach=lsp_attach,
	cmd = { 'diagnostic-languageserver', '--stdio' },
	filetypes = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'json', 'scss'},
	init_options = {
		linters = {
			eslint = {
				sourceName = 'eslint',
				command = './node_modules/.bin/eslint',
				rootPatterns = { '.git' },
				debounce = 100,
				args = {
					'--stdin',
					'--stdin-filename',
					'%filepath',
					'--format',
					'json'
				},
				parseJson = {
					errorsRoot = '[0].messages',
					line = 'line',
					column = 'column',
					endLine = 'endLine',
					endColumn = 'endColumn',
					message = '[eslint] ${message} [${ruleId}]',
					security = 'severity'
				},
				securities = {
					[2] = 'error',
					[1] = 'warning'
				}
			}
		},
		filetypes = {
			javascript = 'eslint',
			javascriptreact = 'eslint',
			typescript = 'eslint',
			typescriptreact = 'eslint'
		},
		formatters = {
			prettierEslint = {
				command = 'prettier-eslint',
				args = { '--stdin' },
				rootPatterns = { '.git' },
			},
			prettier = {
				command = 'prettier',
				args = { '--stdin-filepath', '%filename' }
			}
		},
		formatFiletypes = {
			css = 'prettier',
			javascript = 'prettierEslint',
			javascriptreact = 'prettierEslint',
			json = 'prettier',
			scss = 'prettier',
			typescript = 'prettierEslint',
			typescriptreact = 'prettierEslint'
		}
	}
}

lspconfig.cssls.setup{
	on_attach=lsp_attach
}

lspconfig.cmake.setup{
	on_attach=lsp_attach
}

lspconfig.bashls.setup{
	on_attach=lsp_attach
}

lspconfig.flow.setup{
	on_attach=lsp_attach,
	settings = {
		flow = {
			useNPMPackagedFlow=true
		}
	}
}

lspconfig.rust_analyzer.setup{
	on_attach=lsp_attach
}

require('nlua.lsp.nvim').setup(lspconfig, {
	on_attach = lsp_attach,
	globals = {
		"Color", "c", "Group", "g", "s", "awesome",
	}
})

