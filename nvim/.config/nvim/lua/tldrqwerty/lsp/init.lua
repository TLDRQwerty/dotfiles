local nvim_lsp = require('lspconfig')
local mapper = require('tldrqwerty.utils').mapper
local lsp_signature = require('lsp_signature');

local on_attach = function(client)
	mapper('n', '<leader>e', ':lua vim.lsp.diagnostic.show_line_diagnostics()')
	mapper('n', 'K', ':lua vim.lsp.buf.hover()')
	mapper('n', 'gD', ':lua vim.lsp.buf.declaration()', nil, true);
	mapper('n', 'gd', ':lua vim.lsp.buf.definition()', nil, true);
	mapper('n', 'gi', ':lua vim.lsp.buf.implementation()', nil, true);
	mapper('n', '<c-s>', ':lua vim.lsp.buf.signature_help()', nil, true);
	mapper('n', 'gTD', ':lua vim.lsp.buf.type_definition()', nil, true);
	mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()', nil, true);
	mapper('n', 'gr', ':lua vim.lsp.buf.references()', nil, true);

	mapper('n', 'ca', ':lua vim.lsp.buf.code_action()', nil, true);

	mapper('n', 'dn', ':lua vim.lsp.diagnostic.goto_next()', nil, true);
	mapper('n', 'dp', ':lua vim.lsp.diagnostic.goto_prev()', nil, true);
	mapper('n', 'do', ':lua vim.lsp.diagnostic.set_loclist()', nil, true);

	if client.resolved_capabilities.document_formatting then
		mapper('n', '<leader>f', ':lua vim.lsp.buf.formatting()', nil ,true);
	end

	if client.resolved_capabilities.document_range_formatting then
		mapper('v', '<leader>f', ':lua vim.lsp.buf.range_formatting()', nil, true);
	end

	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec([[
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
			]], false)

		lsp_signature.on_attach({ 
			bind = true,
			handler_opts = {
				border = "none",
			},
			hint_prefix = "🐼 ",
		});
	end

end

require('nlua.lsp.nvim').setup(nvim_lsp, {
	on_attach = on_attach,
})

local eslint = require('diagnosticls-nvim.linters.eslint');
local prettier = require('diagnosticls-nvim.formatters.prettier');

local phpcs = require('diagnosticls-nvim.linters.phpcs');

local stylelint = require('diagnosticls-nvim.linters.stylelint');

local diagnosticls = require('diagnosticls-nvim');

diagnosticls.init({
	on_attach = on_attach,
	format = true,
})

diagnosticls.setup({
	['javascript'] = {
		linter = eslint,
		formatter = prettier,
	},
	['javascriptreact'] = {
		linter = eslint,
		formatter = prettier,
	},
	['typescript'] = {
		linter = eslint,
		formatter = prettier,
	},
	['typescriptreact'] = {
		linter = eslint,
		formatter = prettier,
	},
	['css'] = {
		linter = stylelint,
	},
	['scsss'] = {
		linter = stylelint,
	},
	['less'] = {
		linter = stylelint,
	},
	['php'] = {
		linter = phpcs,
	},
});

nvim_lsp.cssls.setup({
	on_attach = on_attach,
});

nvim_lsp.intelephense.setup({
	on_attach = on_attach,
});

nvim_lsp.html.setup{{
	on_attach = on_attach,
}}

nvim_lsp.flow.setup({
	on_attach = on_attach,
	cmd = { "./node_modules/.bin/flow", "lsp", "--lazy-mode=ide" }
})

nvim_lsp.vimls.setup({
	on_attach = on_attach,
});

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = {"typescript", "typescriptreact"},
});

nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
});

nvim_lsp.cmake.setup({
	on_attach = on_attach
});

nvim_lsp.bashls.setup({
	on_attach = on_attach,
	filetypes = {'sh', 'zsh'}
})

nvim_lsp.html.setup({
	on_attach = on_attach
})
