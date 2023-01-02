local function config()
	require("obsidian").setup({
		dir = "~/Notes/",
		completion = {
			nvim_cmp = true,
		},
		note_frontmatter_func = function(note)
			local out = { id = note.id, aliases = note.aliases, tags = note.tags }
			-- `note.metadata` contains any manually added fields in the frontmatter.
			-- So here we just make sure those fields are kept in the frontmatter.
			if note.metadata ~= nil and util.table_length(note.metadata) > 0 then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end
			return out
		end,
	})
end

return { config = config }
