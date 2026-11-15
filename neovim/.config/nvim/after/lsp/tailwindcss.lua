---@type vim.lsp.Config
return {
	settings = {
		classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
		classFunctions = { "cva", "cx" },
	},
	tailwindCSS = {
		experimental = {
			classRegex = {
				"tw`([^`]*)", -- tw`...`
				'tw="([^"]*)', -- <div tw="..." />
				'tw={"([^"}]*)', -- <div tw={"..."} />
				"tw\\.\\w+`([^`]*)", -- tw.xxx`...`
				"tw\\(.*?\\)`([^`]*)",
			},
		},
	},
}
