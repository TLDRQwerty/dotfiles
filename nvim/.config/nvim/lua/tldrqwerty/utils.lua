local M = {};

M.mapper = function(mode, key, cmd, buffer)
	if buffer == nil then buffer = false; end;
	if buffer == true then
		vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. cmd .. " <CR>", { noremap = true, silent = true });
	else
		vim.api.nvim_set_keymap(mode, key, "<cmd>lua " .. cmd .. " <CR>", { noremap = true, silent = true });
	end
end

return M;
