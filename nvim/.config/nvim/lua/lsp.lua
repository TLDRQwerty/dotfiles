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
	mapper('n', 'E', 'vim.lsp.diagnostic.show_line_diagnostics()')

	completion.on_attach(client)
end

lspconfig.vimls.setup{
	on_attach=lsp_attach
}

lspconfig.tsserver.setup{
	on_attach=lsp_attach
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

require('nlua.lsp.nvim').setup(lspconfig, {
	on_attach = lsp_attach,
	globals = {
		"Color", "c", "Group", "g", "s",
	}
})

