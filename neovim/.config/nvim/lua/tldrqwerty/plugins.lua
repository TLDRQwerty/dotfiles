local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"lewis6991/impatient.nvim",
	-- Theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavor = "mocha",
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	"nikolvs/vim-sunbather",
	"folke/tokyonight.nvim",
	"jacoborus/tender.vim",
	{
		"Lokaltog/monotone.nvim",
		dependencies = {
			"rktjmp/lush.nvim",
		},
	},
	{
		"Shatur/neovim-ayu",
	},
	"JoosepAlviste/palenightfall.nvim",
	"savq/melange-nvim",
	{
		"jesseleite/nvim-noirbuddy",
		dependencies = "tjdevries/colorbuddy.nvim",
		config = function()
			-- vim.api.nvim_command([[colorscheme noirbuddy]])
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.0",
		dependencies = {
			{ dir = "~/Code/telescope-skim" },
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"telescope-fzf-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"popup.nvim",
			"plenary.nvim",
			"telescope-fzf-native.nvim",
			"telescope-github.nvim",
			"crispgm/telescope-heading.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-github.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		init = function()
			require("tldrqwerty.plugins.telescope").init()
		end,
		config = function()
			require("tldrqwerty.plugins.telescope").config()
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("tldrqwerty.plugins.treesitter").config()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter" },
	},
	{
		"nvim-treesitter/playground",
		dependencies = { "nvim-treesitter" },
	},

	{
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				-- LSP Support
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },

				-- Autocompletion
				{ "hrsh7th/nvim-cmp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },

				-- Snippets
				{ "L3MON4D3/LuaSnip" },
				{ "rafamadriz/friendly-snippets" },

				-- Inlay hints
				{ "simrat39/inlay-hints.nvim", enabled = false },
				{ "lvimuser/lsp-inlayhints.nvim", enabled = false },

				{
					"roobert/tailwindcss-colorizer-cmp.nvim",
					config = function()
						require("tailwindcss-colorizer-cmp").setup({
							color_square_width = 2,
						})
					end,
				},

				{
					"glepnir/lspsaga.nvim",
					branch = "main",
				},

				{
					"jose-elias-alvarez/null-ls.nvim",
					dependencies = {
						"nvim-lua/plenary.nvim",
						"neovim/nvim-lspconfig",
					},
				},

				{ "jose-elias-alvarez/typescript.nvim" },
			},
		},
		"simrat39/rust-tools.nvim",
	},

	{
		"luukvbaal/statuscol.nvim",
		config = function()
			require("statuscol").setup()
		end,
	},

	{
		"aserowy/tmux.nvim",
		config = function()
			require("tldrqwerty.plugins.tmux").config()
		end,
	},

	"nvim-lualine/lualine.nvim",

	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("tldrqwerty.plugins.toggleterm").config()
		end,
	},

	{
		"lmburns/lf.nvim",
		config = function()
			require("tldrqwerty.plugins.lf").config()
		end,
		dependencies = { "plenary.nvim", "toggleterm.nvim" },
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("tldrqwerty.plugins.comment").config()
		end,
		dependencies = "nvim-ts-context-commentstring",
	},

	"JoosepAlviste/nvim-ts-context-commentstring",

	{
		"gelguy/wilder.nvim",
		config = function()
			require("tldrqwerty.plugins.wilder").config()
		end,
	},

	"gpanders/editorconfig.nvim",

	{
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("tldrqwerty.plugins.gitsigns").config()
			end,
		},
		{
			"akinsho/git-conflict.nvim",
			config = function()
				require("tldrqwerty.plugins.git-conflict").config()
			end,
		},
		{
			"ldelossa/gh.nvim",
			dependencies = {
				{
					"ldelossa/litee.nvim",
					config = function()
						require("litee.lib").setup()
					end,
				},
			},
			config = function()
				require("litee.gh").setup({
					-- deprecated, around for compatability for now.
					jump_mode = "invoking",
					-- remap the arrow keys to resize any litee.nvim windows.
					map_resize_keys = false,
					-- do not map any keys inside any gh.nvim buffers.
					disable_keymaps = false,
					-- the icon set to use.
					icon_set = "default",
					-- any custom icons to use.
					icon_set_custom = nil,
					-- whether to register the @username and #issue_number omnifunc completion
					-- in buffers which start with .git/
					git_buffer_completion = true,
					-- defines keymaps in gh.nvim buffers.
					keymaps = {
						-- when inside a gh.nvim panel, this key will open a node if it has
						-- any futher functionality. for example, hitting <CR> on a commit node
						-- will open the commit's changed files in a new gh.nvim panel.
						open = "<CR>",
						-- when inside a gh.nvim panel, expand a collapsed node
						expand = "zo",
						-- when inside a gh.nvim panel, collpased and expanded node
						collapse = "zc",
						-- when cursor is over a "#1234" formatted issue or PR, open its details
						-- and comments in a new tab.
						goto_issue = "gd",
						-- show any details about a node, typically, this reveals commit messages
						-- and submitted review bodys.
						details = "d",
						-- inside a convo buffer, submit a comment
						submit_comment = "<C-s>",
						-- inside a convo buffer, when your cursor is ontop of a comment, open
						-- up a set of actions that can be performed.
						actions = "<C-a>",
						-- inside a thread convo buffer, resolve the thread.
						resolve_thread = "<C-r>",
						-- inside a gh.nvim panel, if possible, open the node's web URL in your
						-- browser. useful particularily for digging into external failed CI
						-- checks.
						goto_web = "gx",
					},
				})
			end,
		},
	},

	"rcarriga/nvim-notify",

	{
		"mbbill/undotree",
		config = function()
			require("tldrqwerty.plugins.undotree").config()
		end,
	},

	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 15
		end,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		event = "BufReadPost",
		config = function()
			require("tldrqwerty.plugins.todo-comments").config()
		end,
	},

	{
		"j-hui/fidget.nvim",
		config = function()
			require("tldrqwerty.plugins.fidget").config()
		end,
	},

	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("tldrqwerty.plugins.bufferline").config()
		end,
	},

	{
		"freddiehaddad/feline.nvim",
		config = function()
			local ctp_feline = require("catppuccin.groups.integrations.feline")
			ctp_feline.setup({})

			require("feline").setup({
				components = ctp_feline.get(),
			})
		end,
	},

	{
		"epwalsh/obsidian.nvim",
		config = function()
			require("tldrqwerty.plugins.obsidian").config()
		end,
	},

	{ "github/copilot.vim", enabled = false },
})
