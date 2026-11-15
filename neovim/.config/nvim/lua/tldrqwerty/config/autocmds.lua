vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	desc = "Highlight yanked text",
	callback = function()
		vim.hl.on_yank({ timeout = 200 })
	end,
})

