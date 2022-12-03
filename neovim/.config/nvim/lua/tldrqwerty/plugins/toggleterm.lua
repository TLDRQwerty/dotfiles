local function config()
	require("toggleterm").setup({})

	local Terminal  = require('toggleterm.terminal').Terminal

	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
	function _lazygit_toggle()
		lazygit:toggle()
	end
	vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })


	local gobang = Terminal:new({ cmd = "gobang", hidden = true, direction = "float" })
	function _gobang_toggle()
		gobang:toggle()
	end
	vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua _gobang_toggle()<CR>', { noremap = true, silent = true })

	local float_terminal = Terminal:new({
		direction = "float"
	})
	function _float_terminal_toggle()
		float_terminal:toggle()
	end
	vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>lua _float_terminal_toggle()<cr>', { noremap = true, silent = true })

	local tab_terminal = Terminal:new({
		direction = "tab"
	})
	function _tab_terminal_toggle()
		tab_terminal:toggle()
	end
	vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>lua _tab_terminal_toggle()<cr>', { noremap = true, silent = true })

	local vertical_terminal = Terminal:new({
		direction = "vertical"
	})
	function _vertical_terminal_toggle()
		vertical_terminal:toggle()
	end
	vim.api.nvim_set_keymap('n', '<leader>tv', '<cmd>lua _vertical_terminal_toggle()<cr>', { noremap = true, silent = true })

	local terminal = Terminal:new({
	})
	function _horizontal_terminal_toggle()
		terminal:toggle()
	end
	vim.api.nvim_set_keymap('n', '<leader>ts', '<cmd>lua _horizontal_terminal_toggle()<cr>', { noremap = true, silent = true })
end

return { config = config }
