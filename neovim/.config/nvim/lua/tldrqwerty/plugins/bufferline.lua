local function config()
	require("bufferline").setup({
		highlights = require("catppuccin.groups.integrations.bufferline").get(),
	})
end

return { config = config }
