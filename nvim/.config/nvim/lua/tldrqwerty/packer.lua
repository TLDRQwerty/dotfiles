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
		use { 'glepnir/lspsaga.nvim' }
		use { 'wbthomason/packer.nvim' };
		use { 'neovim/nvim-lspconfig' };
		use { 'tjdevries/nlua.nvim' };
		use { 'creativenull/diagnosticls-nvim' };
		use { 'hrsh7th/nvim-compe' }
		use {
			'nvim-telescope/telescope.nvim',
			requires = {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}
		}
		use {'nvim-lua/popup.nvim' }
		use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
		use { 'ray-x/lsp_signature.nvim' }
		use { 'christoomey/vim-tmux-navigator' }
		-- use { 'dense-analysis/ale' }
		use { 'prettier/vim-prettier', run = "yarn install" }
		use { 
			'hoob3rt/lualine.nvim',
			-- requires = { 'kyazdani42/nvim-web-devicons', opt = true }
		}
		use { 'editorconfig/editorconfig-vim' }
		use {
			'lewis6991/gitsigns.nvim',
			requires = { 'nvim-lua/plenary.nvim' }
		}

		use { 'lewis6991/spellsitter.nvim' }

		-- JavaScript
		-- use { 'pangloss/vim-javascript' }
		-- use { 'MaxMEllon/vim-jsx-pretty' }
		-- use { 'yuezk/vim-js' }

		-- TypeScript
		-- use { 'leafgarland/typescript-vim' }

		-- PHP
		-- use { '2072/PHP-Indenting-for-VIm' }

		use { 'sheerun/vim-polyglot' }

		use { 'kdheepak/lazygit.nvim' }

		use { 'jiangmiao/auto-pairs' }

		use { 'tpope/vim-fugitive' }

		-- Themes
		use { 'ray-x/aurora' }
		use { 'shaunsingh/seoul256.nvim' }
		use { 'sainnhe/sonokai' }
		use { 'kyazdani42/blue-moon' }
		use { 'Iron-E/nvim-highlite' }
		use { 'rockerBOO/boo-colorscheme-nvim' }
		use { 'mhartington/oceanic-next' }
		use { 'RishabhRD/nvim-rdark' }
		use { 'sainnhe/edge' }
		use { 'bkegley/gloombuddy',
			requires = 'tjdevries/colorbuddy.vim' }
		use { 'marko-cerovac/material.nvim',
			requires = 'tjdevries/colorbuddy.vim' }
		use { 'bluz71/vim-moonfly-colors' }
		use { 'jim-at-jibba/ariake-vim-colors' }
		use { 'Matsuuu/pinkmare' }
		use { 'shaunsingh/solarized.nvim' }
		use { 'Mofiqul/dracula.nvim' }
		use { 'folke/tokyonight.nvim' }

		-- File manu
		use { 'ms-jpq/chadtree',
			branch = 'chad',
			run = 'python3 -m chadtree deps'
		}

	use { 'tiagofumo/vim-nerdtree-syntax-highlight',
		requires = 'ms-jpq/chadtree'
	}
	end)
end

M.init = function()
	setup();
	install();
end

return M
