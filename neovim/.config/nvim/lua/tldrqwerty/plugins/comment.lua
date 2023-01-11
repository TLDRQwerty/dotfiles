local function config()
	local comment = require("Comment")
	comment.setup({
		pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	})
end

return { config = config }
