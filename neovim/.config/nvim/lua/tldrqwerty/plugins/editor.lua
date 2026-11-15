vim.pack.add({
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/stevearc/conform.nvim" }
})

require("todo-comments").setup({})

vim.lsp.document_color.enable(false)
require('nvim-highlight-colors').setup({})

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "●",
		format = function(diagnostic)
			return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
		end,
	},
	severity_sort = true,
})

local conform = require("conform")

local web_formatters = {
    "oxfmt",
    "prettierd",
    "prettier",
    stop_after_first = true,
}

local function project_root(bufnr)
    local name = vim.api.nvim_buf_get_name(bufnr)
    local dir = name ~= "" and vim.fs.dirname(name) or vim.fn.getcwd()

    return vim.fs.root(dir, { ".git" }) or dir
end

-- Laravel Sail / PHP
local function sail_project(bufnr)
    local root = project_root(bufnr)

    for _, script in ipairs({ "bin/sail", "vendor/bin/sail" }) do
        local path = root .. "/" .. script

        if vim.fn.executable(path) == 1 then
            return path, root
        end
    end
end

local function php_formatters(bufnr)
    if sail_project(bufnr) then
        return { "sail_pint" }
    end

    if vim.fn.executable(project_root(bufnr) .. "/vendor/bin/pint") == 1 then
        return { "pint" }
    end

    return {}
end

---@type conform.setupOpts
local conform_opts = {
    formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },

        php = php_formatters,

        rust = { lsp_format = "prefer" },

        javascript = web_formatters,
        javascriptreact = web_formatters,
        typescript = web_formatters,
        typescriptreact = web_formatters,
        vue = web_formatters,
        svelte = web_formatters,
        astro = web_formatters,
        css = web_formatters,
        scss = web_formatters,
        less = web_formatters,
        html = web_formatters,
        json = web_formatters,
        jsonc = web_formatters,
        yaml = web_formatters,
        graphql = web_formatters,
        markdown = web_formatters,
        ["markdown.mdx"] = web_formatters,
    },

    formatters = {
        oxfmt = {
            require_cwd = true,
        },

        sail_pint = {
            command = function(_, ctx)
                local sail = sail_project(ctx.buf)
                return sail or "bin/sail"
            end,
            args = { "bin", "pint", "$RELATIVE_FILEPATH" },
            cwd = function(_, ctx)
                local _, root = sail_project(ctx.buf)
                return root
            end,
            stdin = false,
            tmpfile_format = "pint-$RANDOM-$FILENAME",
        },
    },

    default_format_opts = {
        stop_after_first = true,
        lsp_format = "fallback",
    },

    format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end

        return { timeout_ms = 5000 }
    end,
}
conform.setup(conform_opts)

vim.keymap.set({ "n", "v" }, "<leader>f", function()
    conform.format({ async = true })
end, { desc = "Format buffer" })
