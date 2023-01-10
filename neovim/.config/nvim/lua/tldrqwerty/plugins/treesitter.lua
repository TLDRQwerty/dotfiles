local function config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = "all",
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "markdown" },
		},
	})
end

local function setup() end

return { config = config, setup = setup }