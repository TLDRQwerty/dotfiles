vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

require("mason").setup()

---@type MasonToolInstallerSettings
local mason_tool_installer_opts = {
	ensure_installed = {
		"lua-language-server",
		"kotlin-lsp",
		"prettier",
		"prettierd",
		"stylua",
		"shellcheck",
		"eslint-lsp",
		"tailwindcss-language-server",
		"intelephense",
		"vtsls",
	},
	auto_update = false,
	run_on_start = true,
}
require("mason-tool-installer").setup(mason_tool_installer_opts)

local capabilities = {
	workspace = {
		fileOperations = {
			didRename = true,
			willRename = true,
		},
	},
}
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(capabilities),
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
		vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)

		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		vim.keymap.set("n", "dn", function()
			vim.diagnostic.jump({ count = -1 })
		end, opts)
		vim.keymap.set("n", "dp", function()
			vim.diagnostic.jump({ count = 1 })
		end, opts)
		vim.keymap.set("n", "d<S-n>", function()
			vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
		end, opts)
		vim.keymap.set("n", "d<S-p>", function()
			vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
		end, opts)

		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

		vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
	end,
})

vim.lsp.enable({
	"lua_ls",
	"kotlin_lsp",
	"cssls",
	"vtsls",
	"tailwindcss",
	"rust_analyzer",
	"intelephense",
})
