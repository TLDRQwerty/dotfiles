local augroup = require('tldrqwerty.utils').augroup
local keymap = vim.keymap

return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{
				"folke/neodev.nvim",
				opts = {},
			},
			{
				"williamboman/mason.nvim",
				opts = {},
			},
			{
				"williamboman/mason-lspconfig.nvim",
			},
		},
		opts = {
			servers = {
				ts_ls = {},
				astro = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace"
							},
							hint = {
								enable = true
							}
						}
					}
				},
				tailwindcss = {
					settings = {
						classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
					}
				},
				flow = {},
				cssls = {},
				cssmodules_ls = {},
				rust_analyzer = {},
				eslint = {},
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
			},
			inlay_hints = {
				enabled = true,
			},
			setup = {},
			capabilities = {
			},
		},
		config = function(_, opts)
			local lspconfig = require('lspconfig')
			vim.api.nvim_create_autocmd("LspAttach", {
				group = augroup("UserLpsConfig"),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					local o = { buffer = ev.buf, silent = true }
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
					vim.keymap.set("n", "d<S-n>", function()
						vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
					end, o)
					vim.keymap.set("n", "d<S-p>", function()
						vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
					end, o)

					keymap.set("n", "ca", vim.lsp.buf.code_action, o)

					-- keymap.set("n", "<space>f", function()
					-- 	vim.lsp.buf.format({ async = true })
					-- end, o)

					local client = vim.lsp.get_client_by_id(ev.data.client_id)
				end
			})

			local servers = opts.servers

			if lspconfig.util.path.exists(".flowconfig") then
				servers['tsserver'] = nil
			end

			local mlsp = require('mason-lspconfig')
			local all_mslp_servers = vim.tbl_keys(require('mason-lspconfig.mappings.server').lspconfig_to_package)
			local cmp_nvim_lsp = require('cmp_nvim_lsp')

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

				require('lspconfig')[server_name].setup(server_opts)
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
		end
	},
	{
		"supermaven-inc/supermaven-nvim",
		opts = {
			disable_inline_completion = true,
			disable_keymaps = true,
		},
		config = function(_, opts)
			require("supermaven-nvim").setup(opts)
		end,
	},
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'supermaven-nvim'
		},
		opts = function(_, opts)
			local cmp = require("cmp")

			local has_words_before = function()
				if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then return false end
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
			end

			opts.completion = {
				autocomplete = {
					cmp.TriggerEvent.TextChanged,
					cmp.TriggerEvent.InsertEnter,
				},
				completeopt = "menu,menuone,noinsert,noselect",
			}

			opts.snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end
			}

			opts.mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<S-CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<C-CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end,
				["<Tab>"] = vim.schedule_wrap(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end),
			}

			opts.sources = cmp.config.sources({
					{ name = "supermaven" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
				{
					{ name = "buffer" }
				})

			opts.filetype = cmp.setup.filetype({ "mysql", "sql", "plsql" }, {
				sources = {
					{ name = 'vim-dadbod-completion' },
					{ name = "buffer" },
				}
			})

			opts.cmdline = cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				}),
				matching = { disallow_symbol_nonprefix_matching = false }
			})
		end,
		config = function(_, opts)
			local cmp = require('cmp')

			cmp.setup(opts)
		end
	},
	{
		'stevearc/conform.nvim',
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				lua = { 'stylua' },
				rust = { 'rustfmt', lsp_format = "fallback" },
				javascript = { "prettier", stop_after_first = true },
				javascriptreact = { "prettier", stop_after_first = true },
				typescript = { "prettier", stop_after_first = true },
				typescriptreact = { "prettier", stop_after_first = true }
			}
		},
		keys = {
			{
				"<leader>f",
				function()
					print('formatting')
					require('conform').format({ async = false, timeout = 500, lsp_fallback = true })
				end
			},
		}
	}
}
