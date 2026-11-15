vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
})

---@module 'blink.cmp'
---@type blink.cmp.Config
require("blink.cmp").setup({
	completion = {
		accept = {
			auto_brackets = {
				enabled = true,
			},
		},
    list = {
      selection = {
        preselect = false,
        auto_insert = false
      }
    },
		menu = {
			border = "none",
			draw = {
				treesitter = { "lsp" },
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
	},
	keymap = {
		preset = "none",
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },

		["<C-Space>"] = { "show", "fallback" },
		["<C-e>"] = { "hide", "fallback" },

		["<CR>"] = { "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-m>"] = { "accept", "fallback" },
	},
})

local mini_pairs_opts = {
	modes = { insert = true, command = true, terminal = false },
}
require("mini.pairs").setup(mini_pairs_opts)
