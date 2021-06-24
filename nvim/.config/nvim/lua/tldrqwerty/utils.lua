local M = {};

M.mapper = function(mode, key, cmd, options, buffer)
	if buffer == nil then buffer = false; end;

	if options == nil then
		options = { noremap = true };
	end

	if buffer == true then
		vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd> " .. cmd .. " <CR>", options);
	else
		vim.api.nvim_set_keymap(mode, key, "<cmd> " .. cmd .. " <CR>", options);
	end
end

return M;
