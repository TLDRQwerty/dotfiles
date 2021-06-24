vim.b.ale_linters = { 
	"flow-langauge-server",
	"prettier",
	"eslint",
	"php_cs_fixer"
}
vim.g.ale_linters = { 
	javascript = { "flow-langauge-server", "prettier", "eslint" },
	javascriptreact = { "flow-langauge-server", "prettier", "eslint" },
	php = { "php_cs_fixer" }
}
