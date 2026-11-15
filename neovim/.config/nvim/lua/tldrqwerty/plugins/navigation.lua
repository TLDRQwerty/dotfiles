local directions = {
	{ key = "h", direction = "left" },
	{ key = "j", direction = "down" },
	{ key = "k", direction = "up" },
	{ key = "l", direction = "right" },
}

local function navigate(key, direction)
	local previous_window = vim.api.nvim_get_current_win()
	vim.cmd.wincmd(key)

	-- A different window means the movement stayed inside Neovim. Only cross
	-- into Herdr after reaching the corresponding edge of the Neovim layout.
	if vim.api.nvim_get_current_win() ~= previous_window then
		return
	end

	if vim.env.HERDR_ENV ~= "1" or not vim.env.HERDR_PANE_ID then
		return
	end

	vim.system({
		vim.env.HERDR_BIN_PATH or "herdr",
		"pane",
		"focus",
		"--current",
		"--direction",
		direction,
	}, { detach = true })
end

for _, item in ipairs(directions) do
	vim.keymap.set("n", "<C-" .. item.key .. ">", function()
		navigate(item.key, item.direction)
	end, {
		noremap = true,
		silent = true,
		desc = "Navigate " .. item.direction .. " (Neovim/Herdr)",
	})
end
