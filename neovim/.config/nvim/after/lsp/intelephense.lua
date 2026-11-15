local licence_key = vim.fs.normalize("~/.config/intelephense/licence_key")

---@type vim.lsp.Config
return {
	init_options = {
		-- Intelephense accepts either the key itself or a path to a key file.
		licenceKey = vim.fn.filereadable(licence_key) == 1 and licence_key or nil,
	},
}
