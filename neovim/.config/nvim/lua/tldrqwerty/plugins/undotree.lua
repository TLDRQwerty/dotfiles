local function config()
	vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end

return { config = config }
