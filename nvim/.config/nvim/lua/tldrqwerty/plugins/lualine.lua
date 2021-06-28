local function getFileAndPath()
	local splits = {};
	local filepath = vim.fn.expand("%:p:h")
	for i in filepath:gmatch("(.-)/") do
		table.insert(splits, i);
	end
	print(vim.inspect(splits));
	return 'foobar'
end

require('lualine').setup( {
	options = {
		icons_enabled = nil,
		extensions = { 'quickfix' },
		theme = 'tokyonight',
	},
});

