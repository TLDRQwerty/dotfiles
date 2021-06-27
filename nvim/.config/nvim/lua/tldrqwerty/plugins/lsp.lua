local lspconfig = require('lspconfig');
local lspsignature = require('lsp_signature');

local mapper = require('tldrqwerty.utils').mapper;

local lsp_attach = function(client)
	mapper('n', '<leader>e', ':Lspsaga show_line_diagnostics')
	mapper('n', 'K', ':Lspsaga hover_doc')
	mapper('n', 'gD', ':lua vim.lsp.buf.declaration()', nil, true);
	mapper('n', 'gd', ':lua vim.lsp.buf.definition()', nil, true);
	mapper('n', 'gi', ':lua vim.lsp.buf.implementation()', nil, true);
	mapper('n', '<c-s>', ':Lspsaga signature_help', nil, true);
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
	end

	lspsignature.on_attach({ 
		bind = true,
		handler_opts = {
			border = "none",
		}
	});
end

require('nlua.lsp.nvim').setup(lspconfig, {
	on_attach = lsp_attach,
})

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
}

lspconfig.cssls.setup{
	on_attach=lsp_attach
}

lspconfig.cmake.setup{
	on_attach=lsp_attach
}

lspconfig.bashls.setup{
	on_attach=lsp_attach,
	filetypes = { "sh", "zsh" }
}

lspconfig.flow.setup{
	on_attach=lsp_attach,
	cmd = { "./node_modules/.bin/flow", "lsp", "--lazy-mode=ide" }
}

lspconfig.rust_analyzer.setup{
	on_attach=lsp_attach
}

lspconfig.cssls.setup{
	on_attach=lsp_attach
}

lspconfig.intelephense.setup{
 on_attach=lsp_attach
}

-- lspconfig.phpactor.setup{
--  on_attach=lsp_attach
-- }

lspconfig.cssls.setup{
	on_attach=lsp_attach
}

