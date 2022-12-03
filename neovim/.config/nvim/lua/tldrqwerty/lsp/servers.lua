local nvim_lsp = require('lspconfig')
local null_ls = require('null-ls')
-- local coq = require('coq')

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local object_assign = function(t1, t2)
	for key, value in pairs(t2) do
		t1[key] = value
	end

	return t1
end

local servers = {
	sumneko_lua = {
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT',
					-- Setup your lua path
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { 'vim' },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
					['/usr/share/awesome/lib'] = true,
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
				globals = {
					"vim",
					"use",

					"awesome",
					"client",
					"root",
				}
			},
		},
	},
	tailwindcss = {
		settings = {
			tailwindCSS = {
				classAttributes = { "class", "className", "classList", "ngClass", "style" },
				experimental = {
					classRegex = {
						"tw`([^`]*)",
						"tw=\"([^\"]*)",
						"tw={\"([^\"}]*)",
						"tw\\.\\w+`([^`]*)",
						"tw\\(.*?\\)`([^`]*)",
						"className\"([^\"]*)",
					}
				}
			}
		}
	},
	intelephense = {
		init_options = {
			licenceKey = os.getenv('INTELEPHENSE_KEY')
		},
	},
	flow = {},
	rust_analyzer = {},
	prismals = {},
	astro = {
		filetypes = { "astro" }
	},
}

local function coq_wrapper(client)
	--coq.lsp_ensure_capabilities(client)
end

local on_attach = function(client, bufnr)
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Disable any built-in language formatting
	if client.name ~= "null-ls" then
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	-- vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

	-- vim.api.nvim_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- vim.api.nvim_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- vim.api.nvim_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

	vim.api.nvim_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

	vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

	vim.api.nvim_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

	vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	vim.api.nvim_set_keymap('n', 'dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	vim.api.nvim_set_keymap('n', 'dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	-- vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)

	vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({timeout_ms = 2000})<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

for server, config in pairs(servers) do
	coq_wrapper(
		nvim_lsp[server].setup(
			object_assign(config, { on_attach = on_attach, capabilities = capabilities  })
		)
	)
end

require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = { -- pass options to lspconfig's setup method
		on_attach = on_attach,
		capabilities = capabilities
	},
})

-- NULL_LS (Diagnostics)
local eslint = null_ls.builtins.diagnostics.eslint.with({
	prefer_local = "node_modules/.bin"
})

local prettier = null_ls.builtins.formatting.prettier.with({
	prefer_local = "node_modules/.bin"
})

local stylelint
null_ls.builtins.formatting.stylelint.with({
	prefer_local = "node_modules/.bin"
})

local phpstan = null_ls.builtins.diagnostics.phpstan.with({
	prefer_local = "bin",
})

local phpcsfixer = null_ls.builtins.formatting.phpcsfixer.with({
	prefer_local = "bin",
})

local phpcs = null_ls.builtins.diagnostics.phpcs.with({
	prefer_local = "bin",
})

null_ls.setup({
	on_attach = on_attach,
	sources = {
		-- JavaScript / TypeScript
		prettier,
		eslint,
		stylelint,
		-- PHP
		phpcsfixer,
		phpstan,
		phpcs,
		-- Lua
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.luacheck,

		-- JSON
		null_ls.builtins.diagnostics.jsonlint,

		-- Rust
		null_ls.builtins.formatting.rustfmt,
		-- Extra
		-- null_ls.builtins.code_actions.gitsigns
		null_ls.builtins.completion.spell,
	},
})
