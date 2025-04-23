return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = { "InsertEnter" },
		lazy = true,
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp",     lazy = true },
			{ "hrsh7th/cmp-buffer",       lazy = true },
			{ "hrsh7th/cmp-path",         lazy = true },
			{ "hrsh7th/cmp-cmdline",      lazy = true },
			{ "supermaven-nvim",          lazy = true },

			{ "saadparwaiz1/cmp_luasnip", lazy = true },
		},
		opts = function(_, opts)
			opts.sources = opts.sources or {}

			table.insert(opts.sources, {
				name = "supermaven",
				group_index = 0,
			})

			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0,
			})

			table.insert(opts.sources, {
				name = "nvim_lsp",
			})

			table.insert(opts.sources, {
				name = "path",
			})

			table.insert(opts.sources, {
				name = "buffer",
			})

			local cmp = require("cmp")

			opts.mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			})

			opts.preselect = cmp.PreselectMode.Item

			opts.snippet = opts.snippet or {}
			table.insert(opts.snippet, {
				expand = function(args) require("luasnip").lsp_expand(args.body) end,
			})

			opts.completion = opts.completion or {}
			opts.completion = table.insert(opts.completion, {
				completeopt = "menu,menuone,noinsert",
			})
		end,
		config = function(_, opts)
			local cmp = require("cmp")
			cmp.setup({
				mapping = opts.mapping,
				sources = opts.sources,
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				preselect = opts.preselect,
			})

			cmp.setup.filetype("gitcommit", {
				{ { name = "cmp_git" } },
				{ { name = "buffer" } }
			})

			cmp.setup.cmdline(":", {
				completion = {
					completeopt = "menu,menuone,noselect",
				},
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path", keyword_length = 2 },
				}, {
					{ name = "cmdline", keyword_length = 2 },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				completion = {
					completeopt = "menu,menuone,noselect",
				},
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer", keyword_length = 2 },
				},
			})
		end
	},
	{
		"supermaven-inc/supermaven-nvim",
		opts = {
			disable_keymaps = true,
			disable_inline_completion = true,
		}
	},
	{
		"petertriho/cmp-git",
		opts = {}
	}
}
