local M = {}

M.map_key = function(mode, key, cmd, opts)
	local _opts = opts or {}
	vim.keymap.set(mode, key, cmd, _opts)
end

M.augroup = function(name)
	return vim.api.nvim_create_augroup("tldrqwerty_" .. name, { clear = true })
end

return M
