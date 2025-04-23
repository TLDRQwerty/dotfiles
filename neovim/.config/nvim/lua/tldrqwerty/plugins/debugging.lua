return {
	{
		"tpope/vim-dadbod",
		dependencies = {
			"kristijanhusak/vim-dadbod-ui",
			"kristijanhusak/vim-dadbod-completion",
		},
		cmd = { "DBUI" }
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-plenary",

			-- adapters
			"nvim-neotest/neotest-jest",
			"olimorris/neotest-phpunit",
		},
		opts = {
			discovery = {
				enabled = true
			}
		},
		keys = {
			{ "<leader>s", function() require("neotest").run.run() end },
			{ "<leader>S", function() require("neotest").output.open { enter = true } end },
		},
		config = function(_, opts)
			opts.adapters = opts.adapters or {}
			table.insert(opts.adapters, {
			})

			require("neotest").setup({
				discovery = opts.discovery,
				adapters = {
					require('neotest-jest')({
						jestCommand = "npx jest --",
						jestConfigFile = "jest.config.ts",
						env = { CI = true },
						cwd = function()
							return vim.fn.getcwd()
						end,
					}),
					require("neotest-phpunit"),
				},
			})
		end
	}
}
