vim.pack.add({{ src = "https://github.com/folke/snacks.nvim" }})

local opts = { noremap = true, silent = true }

---@type snacks.Config
local snacks_opts = {
  indent = { enabled = true },
  scroll = { enabled = false },
  picker = {
    enabled = true,
    sources = {
      files = { hidden = true },
      grep = { hidden = true },
    },
  },
  notifier = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  lazygit = {
    enabled = true,
    configure = true,
    config = {
      os = { editPreset = "nvim-remote" },
    },
  }
}
require("snacks").setup(snacks_opts)

local function map(lhs, picker, desc)
  vim.keymap.set("n", lhs, function() Snacks.picker[picker]() end, vim.tbl_extend("force", opts, { desc = desc }))
end

map("<leader>fF", "files", "Find files")
map("<leader>ff", "git_files", "Find git files")
map("<leader>fg", "grep", "Live grep")
map("<leader>fb", "buffers", "Find buffers")
map("<leader>fh", "help", "Help tags")

map("<leader>flr", "lsp_references", "LSP references")
map("<leader>fld", "lsp_definitions", "LSP definitions")
map("<leader>fli", "lsp_implementations", "LSP implementations")
map("<leader>fls", "lsp_symbols", "LSP document symbols")
map("<leader>flw", "lsp_workspace_symbols", "LSP workspace symbols")

map("<leader>fgi", "gh_issue", "GitHub issues")
map("<leader>fgp", "gh_pr", "GitHub PRs")

vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit() end, opts)
