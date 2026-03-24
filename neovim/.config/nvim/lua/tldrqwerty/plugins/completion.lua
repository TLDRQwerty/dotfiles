return {
	{ -- optional blink completion source for require statements and module annotations
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			{
				"giuxtaposition/blink-cmp-copilot",
			},
			-- Snippet engines and collections
			{
				"echasnovski/mini.snippets",
				dependency = "rafamadriz/friendly-snippets",
				version = false,
				config = function(_, opts)
					local gen_loader = require("mini.snippets").gen_loader
					opts.snippets = { gen_loader.from_lang() }
					require("mini.snippets").setup(opts)
				end,
			},
		},
		opts = {
			snippets = { preset = "mini_snippets" },
			completion = {
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					},
				},
				documentation = {
					auto_show = true,
				},
				ghost_text = { enabled = true },
			},
			signature = { enabled = true },
			sources = {
				-- add lazydev to your completion providers
				default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 101,
						async = true,
					},
				},
			},
			keymap = {
				preset = "none",

				["<C-p>"] = { "select_prev", "fallback" },
				-- ["<C-n>"] = { "select_next", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<C-Space>"] = { "show", "fallback" },
				["<C-e>"] = { "hide", "fallback" },

				["<CR>"] = { "accept", "fallback" },

				-- Optional: accept with Ctrl-n like native feel
				["<C-n>"] = { "select_next", "accept" },

				["<Tab>"] = {
					"snippet_forward",
					function() -- sidekick next edit suggestion
						return require("sidekick").nes_jump_or_apply()
					end,
					-- function() -- if you are using Neovim's native inline completions
					-- 	return vim.lsp.inline_completion.get()
					-- end,
					"fallback",
				},
			},
		},
	},
}
