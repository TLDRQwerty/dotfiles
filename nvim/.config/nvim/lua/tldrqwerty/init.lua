require('tldrqwerty.packer').init();
require('tldrqwerty.vim');
require('tldrqwerty.hotkeys');

-- These don't work with config option in packer
require('tldrqwerty.plugins.telescope');
require('tldrqwerty.plugins.treesitter')
require('tldrqwerty.plugins.chadtree')
require('tldrqwerty.plugins.lazygit')

vim.cmd[[ colorscheme tokyonight ]]
