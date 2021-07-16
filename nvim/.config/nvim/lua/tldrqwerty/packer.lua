local M = {};

local function setup()
	local execute = vim.api.nvim_command
	local fn = vim.fn

	local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
		execute 'packadd packer.nvim'
	end
end


local function install()
	vim.cmd [[packadd packer.nvim]]
	require('packer').startup(function(use)
		-- Colorschemes
		use {
			'folke/tokyonight.nvim',
			config = function()
				vim.cmd[[colorscheme tokyonight]]
			end,
		}

		use {
			'marko-cerovac/material.nvim',
			config = function()
				vim.g.material_style = 'deep ocean'
				require('material').set()
			end
		}

		use {
			'novakne/kosmikoa.nvim',
			config = function()
			end,
		}

		use {
			'glepnir/zephyr-nvim',
			config = function()
			end,
		}

		use {
			'bluz71/vim-moonfly-colors'
		}

		use {
			'sainnhe/sonokai'
		}

		use {
			'MordechaiHadad/nvim-papadark',
			requires = {'rktjmp/lush.nvim'}
		}

		use {
			'shaunsingh/moonlight.nvim'
		}

		use {
			'sainnhe/everforest'
		}

		use {
			'yashguptaz/calvera-dark.nvim'
		}

		-- Status line
		use {
			'hoob3rt/lualine.nvim',
			requires = {'kyazdani42/nvim-web-devicons', opt = true},
			config = function()
				require('tldrqwerty.plugins.lualine');
			end
		}

		-- Lsp
		use {
			'neovim/nvim-lspconfig',
			requires = {'tjdevries/nlua.nvim'},
			config = function()
				require('tldrqwerty.lsp.init');
			end
		}

		use {
			'hrsh7th/nvim-compe',
			config = function()
				require('tldrqwerty.lsp.comp');
			end
		}

		-- Unsure
		use {
			'folke/trouble.nvim',
			requires = {'kyazdani42/nvim-web-devicons', opt = true},
			config = function()
				require('tldrqwerty.lsp.trouble');
			end
		}

		-- Another unsure
		use {
			'glepnir/lspsaga.nvim',
		}

		use {
			'creativenull/diagnosticls-nvim',
			requires = {'neovim/nvim-lspconfig'}
		}

		use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate',
			config = function()
				require('tldrqwerty.lsp.treesitter');
			end
		}

		use {
			'nvim-treesitter/playground'
		}

		use {
			'ray-x/lsp_signature.nvim'
		}

		-- Navigation
		use {
			'nvim-telescope/telescope.nvim',
			requires = {
				'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
				{
					'nvim-telescope/telescope-fzf-native.nvim',
					run = 'make',
				}
			},
			config = function()
				require('tldrqwerty.plugins.telescope');
			end
		}

		use {
			'ms-jpq/chadtree',
			branch = 'chad',
			run = 'python3 -m chadtree deps',
			config = function()
				require('tldrqwerty.plugins.chadtree');
			end
		}

		use {
			'numToStr/Navigator.nvim',
			config = function()
				require('tldrqwerty.plugins.navigator');
			end
		}

		use {
			'folke/which-key.nvim',
			config = function()
				require('tldrqwerty.plugins.which-key');
			end
		}

		-- Git
		use {
			'lewis6991/gitsigns.nvim',
			requires = {'nvim-lua/plenary.nvim'},
			config = function()
				require('tldrqwerty.git.gitsigns');
			end
		}

		use {
			'pwntester/octo.nvim',
			config = function()
				require('tldrqwerty.git.octo');
			end
		}

		-- Editor
		use {
			'Pocco81/TrueZen.nvim',
			config = function()
				require('tldrqwerty.plugins.true-zen');
			end
		}

		use {
			'windwp/nvim-autopairs',
			config = function()
				require('tldrqwerty.plugins.nvim-autopairs');
			end
		}

		use {
			'blackCauldron7/surround.nvim',
			config = function()
				require('tldrqwerty.plugins.surround');
			end
		}

		use {
			'windwp/nvim-ts-autotag',
			config = function()
				require('tldrqwerty.plugins.nvim-ts-autotag');
			end
		}

		use {
			'b3nj5m1n/kommentary',
			config = function()
				require('tldrqwerty.plugins.kommentary');
			end
		}

		use {
			'andweeb/presence.nvim',
			config = function()
				require('tldrqwerty.plugins.presence');
			end
		}

		-- Language
		use {
			'sheerun/vim-polyglot',
			config = function()
				vim.cmd([[ let g:javascript_plugin_flow = 1 ]]);
			end
		}

		-- Terminal
		use {
			'akinsho/nvim-toggleterm.lua',
			config = function()
				require('tldrqwerty.plugins.toggleterm')
			end,
		}
	end)
end

M.init = function()
	setup();
	install();
end

return M
