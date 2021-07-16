require('tldrqwerty.vim');
require('tldrqwerty.hotkeys');

vim.defer_fn(function()
	require('tldrqwerty.packer').init();
end, 0)

