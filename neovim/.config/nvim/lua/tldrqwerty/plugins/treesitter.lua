local function config()
	require('nvim-treesitter.configs').setup({
		ignore_install = { "phpdoc" },
		ensure_installed = "all",
	})
end

return { config = config }
