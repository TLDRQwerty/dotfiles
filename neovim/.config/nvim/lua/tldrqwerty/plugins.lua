local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local packer = nil

local function init()
	if packer == nil then
		packer = require("packer")

		packer.init({
			disable_commands = true,
			profile = {
				enable = true,
			},
			display = {
				open_fn = function()
					return require("packer.util").float({ border = "single" })
				end,
			},
		})
	end

	local use = packer.use
	packer.reset()

	use("wbthomason/packer.nvim")

	use("lewis6991/impatient.nvim")

	-- Themes
	use({
		{
			"catppuccin/nvim",
			as = "catppuccin",
		},
		"nikolvs/vim-sunbather",
		"folke/tokyonight.nvim",
		"jacoborus/tender.vim",
		{ "Lokaltog/monotone.nvim", requires = {
			"rktjmp/lush.nvim",
		} },
		{
			"Shatur/neovim-ayu",
			config = function()
				vim.api.nvim_command([[colorscheme ayu-dark]])
			end,
		},
	})

	use({
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = {
				"nvim-lua/popup.nvim",
				"nvim-lua/plenary.nvim",
				"telescope-fzf-native.nvim",
				"nvim-telescope/telescope-ui-select.nvim",
			},
			wants = {
				"popup.nvim",
				"plenary.nvim",
				"telescope-fzf-native.nvim",
				"telescope-github.nvim",
			},
			setup = [[require('tldrqwerty.plugins.telescope').setup()]],
			config = [[require('tldrqwerty.plugins.telescope').config()]],
			module = "telescope",
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		},
		"crispgm/telescope-heading.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-github.nvim",
	})

	use({
		{
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = [[require('tldrqwerty.plugins.treesitter').config()]],
			setup = [[require('tldrqwerty.plugins.treesitter').setup()]],
		},
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			after = "nvim-treesitter",
		},
		{
			"nvim-treesitter/playground",
			after = "nvim-treesitter",
		},
	})

	use({
		{
			"neovim/nvim-lspconfig",
			requires = {
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
				{ "lvimuser/lsp-inlayhints.nvim", disable = true },

				{
					"glepnir/lspsaga.nvim",
					branch = "main",
				},

				{
					"jose-elias-alvarez/null-ls.nvim",
					requires = {
						"nvim-lua/plenary.nvim",
						"neovim/nvim-lspconfig",
					},
				},

				{ "jose-elias-alvarez/typescript.nvim" },
			},
		},
		{
			"simrat39/rust-tools.nvim",
		},
	})

	use({
		"aserowy/tmux.nvim",
		config = [[require('tldrqwerty.plugins.tmux').config()]],
	})

	use("nvim-lualine/lualine.nvim")

	use({
		"akinsho/toggleterm.nvim",
		config = [[require('tldrqwerty.plugins.toggleterm').config()]],
	})

	use({
		"lmburns/lf.nvim",
		config = [[require('tldrqwerty.plugins.lf').config()]],
		requires = { "plenary.nvim", "toggleterm.nvim" },
	})

	use({
		{
			"numToStr/Comment.nvim",
			config = [[require('tldrqwerty.plugins.comment').config()]],
			wants = "nvim-ts-context-commentstring",
		},
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
	})

	use({
		"gelguy/wilder.nvim",
		config = [[require('tldrqwerty.plugins.wilder').config()]],
	})

	use({
		"gpanders/editorconfig.nvim",
	})

	use({
		{
			"lewis6991/gitsigns.nvim",
			config = [[require('tldrqwerty.plugins.gitsigns').config()]],
		},
		{
			"akinsho/git-conflict.nvim",
			config = [[require('tldrqwerty.plugins.git-conflict').config()]],
		},
	})

	use({ "rcarriga/nvim-notify" })

	use({
		"mbbill/undotree",
		config = [[require('tldrqwerty.plugins.undotree').config()]],
	})

	use({
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = [[vim.g.startuptime_tries = 15]],
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		event = "BufReadPost",
		config = [[require('tldrqwerty.plugins.todo-comments').config()]],
	})

	use({
		"j-hui/fidget.nvim",
		config = [[require('tldrqwerty.plugins.fidget').config()]],
	})

	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		requires = "nvim-tree/nvim-web-devicons",
		config = [[require('tldrqwerty.plugins.bufferline').config()]],
	})

	use({
		"epwalsh/obsidian.nvim",
		config = [[require('tldrqwerty.plugins.obsidian').config()]],
	})

	use("github/copilot.vim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end

local plugins = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end,
})

local create_cmd = vim.api.nvim_create_user_command

create_cmd("PackerInstall", function()
	vim.cmd([[packadd packer.nvim]])
	require("tldrqwerty.plugins").install()
end, {})
create_cmd("PackerUpdate", function()
	vim.cmd([[packadd packer.nvim]])
	require("tldrqwerty.plugins").update()
end, {})
create_cmd("PackerSync", function()
	vim.cmd([[packadd packer.nvim]])
	require("tldrqwerty.plugins").sync()
end, {})
create_cmd("PackerClean", function()
	vim.cmd([[packadd packer.nvim]])
	require("tldrqwerty.plugins").clean()
end, {})
create_cmd("PackerCompile", function()
	vim.cmd([[packadd packer.nvim]])
	require("tldrqwerty.plugins").compile()
end, {})

return plugins
