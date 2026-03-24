return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		lazy = false,
		opts = {
			ensure_installed = "all",
			highlight = {
				enable = true,
				disable = function(lang, bufnr)
					return vim.api.nvim_buf_line_count(bufnr) > 5000
				end,
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
}
