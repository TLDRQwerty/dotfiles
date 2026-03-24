return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				lua_ls = {},
				ts_ls = {},
				tailwindcss = {
					settings = {
						classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
						classFunctions = { "cva", "cx" },
					},
					tailwindCSS = {
						experimental = {
							classRegex = {
								"tw`([^`]*)", -- tw`...`
								'tw="([^"]*)', -- <div tw="..." />
								'tw={"([^"}]*)', -- <div tw={"..."} />
								"tw\\.\\w+`([^`]*)", -- tw.xxx`...`
								"tw\\(.*?\\)`([^`]*)",
							},
						},
					},
				},
				intelephense = {
					init_options = {
						licenceKey = vim.fn.expand("$HOME/.config/intelephense/licence_key"),
					},
				},
				rust_analyzer = {},
				eslint = {},
				tinymist = {},
			},
		},
		config = function(_, opts)
			local augroup = require("tldrqwerty.helpers").augroup
			local mason_lspconfig = require("mason-lspconfig")
			local servers = opts.servers or {}

			-- Ensure all servers are installed
			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			-- Setup each server with its config
			for name, config in pairs(servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				vim.lsp.config(name, config)
				vim.lsp.enable(name)
			end

			-- Optionally enable copilot if you want
			vim.lsp.enable("copilot")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = augroup("lsp_attach"),
				callback = function(args)
					local o = { buffer = args.buf, silent = true }
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

					keymap.set("n", "dn", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, o)
					keymap.set("n", "dp", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, o)

					keymap.set("n", "d<S-n>", function()
						vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.ERROR })
					end, o)
					keymap.set("n", "d<S-p>", function()
						vim.diagnostic.jump({ count = -11, float = true, severity = vim.diagnostic.severity.ERROR })
					end, o)

					keymap.set("n", "ca", vim.lsp.buf.code_action, o)

					keymap.set("n", "f", vim.lsp.buf.format, o)
				end,
			})
		end,
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{ "mason-org/mason-lspconfig.nvim" },
		},
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
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				desc = "Format",
			},
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

			opts.formatters.phpstan = {
				command = "phpstan",
				args = { "analyze", "--error-format=raw", "--no-progress", "$FILENAME" },
				stdin = false,
				cwd = require("conform.util").root_file({
					"composer.json",
					"phpstan.neon",
					"phstan.neon.dist",
				}),
			}

			opts.formatters.php_cs_fixer = {
				command = "php-cs-fixer",
				args = { "fix", "$FILENAME", "--quiet" },
				cwd = require("conform.util").root_file({
					"composer.json",
					".php-cs-fixer.dist.php",
				}),
			}

			require("conform").setup(opts)
		end,
	},
}
