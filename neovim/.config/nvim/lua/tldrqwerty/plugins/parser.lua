vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("nvim-treesitter-pack", { clear = true }),
	callback = function(event)
    --- @type string, string
		local name, kind = event.data.spec.name, event.data.kind
		if name ~= "nvim-treesitter" or (kind ~= "install" and kind ~= "update") then
			return
		end

		if not event.data.active then
			vim.cmd.packadd("nvim-treesitter")
		end
		vim.cmd("TSUpdate")
	end,
})

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

---@module 'render-markdown'
---@type render.md.UserConfig
local render_markdown_opts = {}
require("render-markdown").setup(render_markdown_opts)

require("nvim-treesitter").setup({})
require("nvim-treesitter").install({ "all" })
