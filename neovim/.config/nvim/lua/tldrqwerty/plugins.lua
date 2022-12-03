local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nikolvs/vim-sunbather',
	}

	use {
		'folke/tokyonight.nvim'
	}

	use {
		'jacoborus/tender.vim'
	}

	use {
		'Shatur/neovim-ayu',
		config = function()
			vim.api.nvim_command([[colorscheme ayu-mirage]])
		end
	}

	use {
		'shaunsingh/oxocarbon.nvim',
		run = './install.sh',
	}

	use {
		'sam4llis/nvim-tundra'
	}

	use {
		'levouh/tint.nvim',
		config = [[require('tldrqwerty.plugins.tint').config()]]
	}

	use {
		'aserowy/tmux.nvim',
		config = [[require('tldrqwerty.plugins.tmux').config()]]
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{
				'nvim-lua/plenary.nvim'
			}
		},
		config = [[require('tldrqwerty.plugins.telescope').config()]],
		setup = [[require('tldrqwerty.plugins.telescope').setup()]],
		after = {
			'telescope-fzf-native.nvim',
			'telescope-github.nvim'
		}
	}

	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make',
	}

	use {
		'nvim-telescope/telescope-github.nvim'
	}

	use {
		'gpanders/editorconfig.nvim'
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = [[require('tldrqwerty.plugins.treesitter').config()]]
	}

	use {
		'numToStr/Comment.nvim',
		config = [[require('tldrqwerty.plugins.comment').config()]]
	}

	use {
		'gelguy/wilder.nvim',
		config = [[require('tldrqwerty.plugins.wilder').config()]]
	}

	use {
		'lewis6991/gitsigns.nvim',
		config = [[require('tldrqwerty.plugins.gitsigns').config()]]
	}

	use {
		'akinsho/toggleterm.nvim',
		config = [[require('tldrqwerty.plugins.toggleterm').config()]]
	}

	use {
		'neovim/nvim-lspconfig'
	}

	use {
		'jose-elias-alvarez/null-ls.nvim',
	}

	use {
		'jose-elias-alvarez/typescript.nvim'
	}

	use {
		'hrsh7th/cmp-nvim-lsp',
		config = [[require('tldrqwerty.plugins.cmp').config()]],
    branch = 'main',
	}
	use {
		'hrsh7th/cmp-buffer'
	}
	use {
		'hrsh7th/cmp-path'
	}
	use {
		'hrsh7th/cmp-cmdline'
	}
	use {
		'hrsh7th/nvim-cmp'
	}
	use {
		'hrsh7th/cmp-nvim-lsp-signature-help'
	}

	use {
		'hrsh7th/vim-vsnip'
	}
	use {
		'hrsh7th/cmp-vsnip'
	}

	use {
		'ray-x/lsp_signature.nvim',
		config = [[require('tldrqwerty.plugins.lsp_signature').config()]],
	}

	use {
		'folke/trouble.nvim',
		requires = "kyazdani42/nvim-web-devicons",
		config = [[require('tldrqwerty.plugins.trouble').config()]],
	}

	use {
		'folke/todo-comments.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = [[require('tldrqwerty.plugins.todo-comments').config()]],
	}

	use {
		'lmburns/lf.nvim',
		config = [[require('tldrqwerty.plugins.lf').config()]],
		requires = {'plenary.nvim', 'toggleterm.nvim'}
	}

  use {
    'github/copilot.vim',
  }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
