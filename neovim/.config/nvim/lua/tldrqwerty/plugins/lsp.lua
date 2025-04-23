return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim",          opts = {} },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "cmp-nvim-lsp" },
		},
		opts = {
			setup = {},
			servers = {
				ts_ls = {},
				astro = {},
				lua_ls = {},
				eslint = {},
				tailwindcss = {
					settings = {
						classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
						classFunctions = { "cva", "cx" },
					},
					tailwindCSS = {
						experimental = {
							classRegex = {
								"tw`([^`]*)", -- tw`...`
								"tw=\"([^\"]*)", -- <div tw="..." />
								"tw={\"([^\"}]*)", -- <div tw={"..."} />
								"tw\\.\\w+`([^`]*)", -- tw.xxx`...`
								"tw\\(.*?\\)`([^`]*)"
							}
						}
					}
				},
				intelephense = {
					init_options = {
						licenceKey = vim.fn.expand("$HOME/.config/intelephense/licence_key"),
					},
				},
				flow = {},
			},
		},
		config = function(_, opts)
			local augroup = require("tldrqwerty.helpers").augroup

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

					keymap.set("n", "dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, o)
					keymap.set("n", "dp", function() vim.diagnostic.jump({ count = -1, float = true }) end, o)

					keymap.set("n", "d<S-n>", function()
						vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.ERROR })
					end, o)
					keymap.set("n", "d<S-p>", function()
						vim.diagnostic.jump({ count = -11, float = true, severity = vim.diagnostic.severity.ERROR })
					end, o)

					keymap.set("n", "ca", vim.lsp.buf.code_action, o)
				end,
			})

			local servers = opts.servers

			local lspconfig = require('lspconfig')
			if vim.uv.fs_stat('.flowconfig') then
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

			mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup }, automatic_installation = true })
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		'stevearc/conform.nvim',
		event = "BufWritePre",
		keys = {
			{ "<leader>f", function() require("conform").format({ async = true }) end, desc = "Format" },
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				astro = { "prettier" },

				php = { "php_cs_fixer", "phpstan" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			init = function()
				vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
			end,
		},
		config = function(_, opts)
			opts.formatters = opts.formatters or {}

			table.insert(opts.formatters, {
			})

			require("conform").setup({
				phpstan = {
					command = "./bin/sail ",
					args = { "phpstan", "analyze", "--error-format=raw", "--no-progress", "$FILENAME" },
					stdin = false,
					cwd = require("conform.util").root_file({
						"composer.json",
						"phpstan.neon",
						"phstan.neon.dist",
					}),
				},
				php_cs_fixer = {
					command = "./bin/sail ",
					args = { "php-cs-fixer", "fix", "$FILENAME", "--quiet" },
					cwd = require("conform.util").root_file({
						"composer.json",
						".php-cs-fixer.dist.php",
					}),
				},
				formatters_by_ft = opts.formatters_by_ft,
				defaault_format_opts = opts.default_format_opts,
				init = opts.init,
			})
		end
	},
}
