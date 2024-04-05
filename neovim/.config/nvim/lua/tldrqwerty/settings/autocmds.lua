local augroup = require("tldrqwerty.utils").augroup

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("TextYankPost"),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end
})

-- Wrap text at 80 columns and enable spell checking for markdown and gitcommit
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("wrap_spell"),
	pattern = { "gitcommit" },
	callback = function()
		vim.opt_local.textwidth = 80
		vim.opt_local.colorcolumn = "80"

		vim.opt_local.spell = true
	end
})

-- Create directories before writing
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
