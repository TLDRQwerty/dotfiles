local safe_require = require("tldrqwerty.utils").safe_require

local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local cmp = require("cmp")
local saga = safe_require("lspsaga")

require("mason").setup()
require("mason-lspconfig").setup()

if saga then
	saga.setup({
		ui = {
			theme = "round",
			winblend = 0,
			expand = "",
			collapse = "",
			preview = "",
			code_action = "",
			diagnostic = "",
			incoming = "",
			outgoing = "",
			kind = {},
		},
		lightbulb = {
			enable = true,
			enable_in_insert = false,
			sign = true,
			sign_priority = 40,
			virtual_text = true,
		},
		symbol_in_winbar = {
			enable = true,
			separator = " >> ",
			hide_keyword = true,
			show_file = true,
			folder_level = 2,
			respect_root = false,
			color_mode = false,
		},
	})
end

local inlay_hints = safe_require("inlay-hints")

if inlay_hints then
	inlay_hints.setup({
		renderer = "inlay-hints/render/eol",

		hints = {
			parameter = {
				show = true,
				highlight = "whitespace",
			},
			type = {
				show = true,
				highlight = "Whitespace",
			},
		},

		-- Only show inlay hints for the current line
		only_current_line = false,

		eol = {
			-- whether to align to the extreme right or not
			right_align = false,

			-- padding from the right if right_align is true
			right_align_padding = 7,

			parameter = {
				separator = ", ",
				format = function(hints)
					return string.format(" <- (%s)", hints)
				end,
			},

			type = {
				separator = ", ",
				format = function(hints)
					return string.format(" => %s", hints)
				end,
			},
		},
	})
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif require("luasnip").jumpable(-1) then
		-- 		require("luasnip").jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ "/", "?" }, {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })

local servers = {}

servers["tailwindcss"] = {
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "classList", "ngClass", "style" },
			experimental = {
				classRegex = {
					"tw`([^`]*)",
					'tw="([^"]*)',
					'tw={"([^"}]*)',
					"tw\\.\\w+`([^`]*)",
					"tw\\(.*?\\)`([^`]*)",
					'className"([^"]*)',
				},
			},
		},
	},
}

servers["lua_ls"] = {
	settings = {
		Lua = {
			hint = {
				enable = true,
			},
		},
	},
}

servers["gopls"] = {
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
}

servers["prismals"] = {
	settings = {
		prisma = {
			format = {
				enable = true,
			},
		},
	},
}

servers["svelte"] = {
  settings = {
    svelte = {
      plugin = {
        svelte = {
          enable = true,
        },
      },
    },
  },
}

-- servers["tsserver"] = {
-- 	settings = {
-- 		javascript = {
-- 			inlayHints = {
-- 				includeInlayEnumMemberValueHints = true,
-- 				includeInlayFunctionLikeReturnTypeHints = true,
-- 				includeInlayFunctionParameterTypeHints = true,
-- 				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
-- 				includeInlayPropertyDeclarationTypeHints = true,
-- 				includeInlayVariableTypeHints = true,
-- 			},
-- 		},
-- 		typescript = {
-- 			inlayHints = {
-- 				includeInlayEnumMemberValueHints = true,
-- 				includeInlayFunctionLikeReturnTypeHints = true,
-- 				includeInlayFunctionParameterTypeHints = true,
-- 				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
-- 				includeInlayPropertyDeclarationTypeHints = true,
-- 				includeInlayVariableTypeHints = true,
-- 			},
-- 		},
-- 	},
-- }

servers["intelephense"] = {
	init_options = {
		licenceKey = os.getenv("INTELEPHENSE_KEY"),
	},
}

servers["astro"] = {
	filetypes = { "astro" },
}

servers["grammarly"] = {
  filetypes = { "markdown", "text" },
}

local function on_attach(client, bufnr)
	if inlay_hints then
		inlay_hints.on_attach(client, bufnr)
	end

	local opts = { buffer = bufnr, remap = false }
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	if saga then
		vim.keymap.set("n", "ca", "<cmd>Lspsaga code_action<CR>", opts)
		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)

		vim.keymap.set("n", "dp", function()
			require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end, { silent = true })
		vim.keymap.set("n", "dn", function()
			require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
		end, { silent = true })

		vim.keymap.set("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
		vim.keymap.set("n", "<leader>E", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
		vim.keymap.set("n", "pd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
		vim.keymap.set("n", "pf", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
	else
		vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "dn", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, opts)

		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ timeout_ms = 2000 })
	end, opts)

	vim.keymap.set("n", "gf", function()
		if require("obsidian").util.cursor_on_markdown_link() then
			return "<cmd>ObsidianFollowLink<CR>"
		else
			return "gf"
		end
	end, { noremap = false, expr = true })
end

local function prefer_null_ls_fmt(client)
	client.server_capabilities.documentHighlightProvider = false
	client.server_capabilities.documentFormattingProvider = false
end

for server, c in pairs(servers) do
	-- if c.prefer_null_ls then
	-- 	if c.on_attach then
	-- 		local old_on_attach = c.on_attach
	-- 		c.on_attach = function(client, bufnr)
	-- 			old_on_attach(client, bufnr)
	-- 			prefer_null_ls_fmt(client)
	-- 		end
	-- 	else
	-- 		c.on_attach = prefer_null_ls_fmt
	-- 	end
	-- elseif not c.on_attach then
	-- 	c.on_attach = on_attach
	-- end

	local maybe_old_on_attach = c.on_attach
	c.on_attach = function(client, bufnr)
		if maybe_old_on_attach then
			maybe_old_on_attach(client, bufnr)
		end
		if not c.prefer_built_in then
			prefer_null_ls_fmt(client)
		end
		c.on_attach = on_attach
	end

	local client_capabilities = require("cmp_nvim_lsp").default_capabilities()
	client_capabilities.offsetEncoding = { "utf-16" }

	c.capabilities = vim.tbl_deep_extend("keep", c.capabilities or {}, client_capabilities)
	lspconfig[server].setup(c)
end

local typescript = safe_require("typescript")
if typescript then
	typescript.setup({
		disable_commands = false, -- prevent the plugin from creating Vim commands
		debug = false, -- enable debug logging for commands
		go_to_source_definition = {
			fallback = true, -- fall back to standard LSP definition on failure
		},
		server = { -- pass options to lspconfig's setup method
			on_attach = on_attach,
		},
	})
end

local rust_tools = safe_require("rust-tools")

if rust_tools then
	rust_tools.setup({
		tools = {
			on_initialized = function()
				if inlay_hints then
					inlay_hints.set_all()
				end
			end,
			inlay_hints = {
				auto = false,
			},
		},
		server = {
			on_attach = on_attach,
		},
	})
end

-- null-ls setup
local null_fmt = null_ls.builtins.formatting
local null_diag = null_ls.builtins.diagnostics
local null_act = null_ls.builtins.code_actions

local sources = {
	null_diag.eslint.with({
		prefer_local = "node_modules/.bin",
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "astro", "svelte" },
	}),
	null_diag.phpcs.with({
		prefer_local = "bin",
	}),
	null_diag.phpstan,

	null_fmt.prettier.with({
		prefer_local = "node_modules/.bin",
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "astro", "svelte" },
	}),
	null_fmt.rustfmt,
	null_fmt.stylua,
	null_fmt.trim_whitespace,
}

-- local typescript_cmd = safe_require("typescript.extensions.null-ls.code-actions")

-- if typescript_cmd then
-- 	table.insert(sources, typescript_cmd)
-- end

if safe_require("gitsigns") then
	table.insert(sources, null_act.gitsigns)
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
