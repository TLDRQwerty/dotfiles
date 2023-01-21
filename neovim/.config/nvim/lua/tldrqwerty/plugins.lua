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
	"wbthomason/packer.nvim",
	"lewis6991/impatient.nvim",
	-- Theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
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
		config = function()
			vim.api.nvim_command([[colorscheme ayu-dark]])
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.0",
		dependencies = {
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
				{ "simrat39/inlay-hints.nvim" },
				{ "lvimuser/lsp-inlayhints.nvim", enabled = false },

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
		"epwalsh/obsidian.nvim",
		config = function()
			require("tldrqwerty.plugins.obsidian").config()
		end,
	},

	"github/copilot.vim",
})
