return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "cmp-nvim-lsp" },
	},
	opts = {
		setup = {},
		servers = {
			lua_ls = {},
			ts_ls = {},
			astro = {},
			eslint = {},
			flow = {},
			cssls = {},
			cssmodules_ls = {},
			tailwindcss = {
				settings = {
					classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
				},
			},
			gopls = {},
			htmx = {},
			svelte = {},
			bashls = {},
			grammarly = {},
			intelephense = {
				init_options = {
					licenceKey = os.getenv("INTELEPHENSE_KEY"),
				},
			},
			typst_lsp = {},
			rust_analyzer = {},
		},
	},
	config = function(_, opts)
		local augroup = require("tldrqwerty.utils").augroup

		vim.api.nvim_create_autocmd("LspAttach", {
			group = augroup("LspConfig"),
			callback = function(ev)
				local o = { buffer = ev.buf, silent = true }
				local keymap = vim.keymap

				keymap.set("n", "K", vim.lsp.buf.hover, o)
				keymap.set("n", "<leader>e", vim.diagnostic.open_float, o)

				keymap.set("n", "gD", vim.lsp.buf.declaration, o)
				keymap.set("n", "gd", vim.lsp.buf.definition, o)
				keymap.set("n", "gi", vim.lsp.buf.implementation, o)
				keymap.set("n", "gr", vim.lsp.buf.references, o)

				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, o)

				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, o)

				keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, o)

				keymap.set("n", "dn", vim.diagnostic.goto_next, o)
				keymap.set("n", "dp", vim.diagnostic.goto_prev, o)

				keymap.set("n", "d<S-n>", function()
					vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
				end, o)
				keymap.set("n", "d<S-p>", function()
					vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
				end, o)

				keymap.set("n", "ca", vim.lsp.buf.code_action, o)
			end,
		})

		local servers = opts.servers

		local lspconfig = require('lspconfig')
		if lspconfig.util.path.exists('.flowconfig') then
			servers['ts_ls'] = nil
		end

		local mlsp = require("mason-lspconfig")
		local all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_nvim_lsp.default_capabilities(),
			opts.capabilities or {}
		)

		local function setup(server_name)
			local server_opts = vim.tbl_extend("force", {
				capabilities = capabilities,
			}, servers[server_name] or {})

			if opts.setup[server_name] then
				if opts.setup[server_name](server_name, server_opts) then
					return
				end
			end

			require("lspconfig")[server_name].setup(server_opts)
		end

		local ensure_installed = {}
		for server, server_opts in pairs(servers) do
			if vim.tbl_contains(all_mslp_servers, server) then
				ensure_installed[#ensure_installed + 1] = server
			else
				setup(server)
			end
		end

		mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
	end,
}
