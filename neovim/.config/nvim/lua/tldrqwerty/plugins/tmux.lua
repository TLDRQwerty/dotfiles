local function config()
	local tmux = require("tmux")
	tmux.setup({
		copy_sync = {
			enable = true,
		},
		navigation = {
			enable_default_keybindings = true,
		},
		resize = {
			enable_default_keybindings = true,
		},
	})
end

return { config = config }
