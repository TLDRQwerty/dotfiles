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

vim.keymap.set("n", "<leader>fF", function() Snacks.picker.files() end, opts)
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.git_files() end, opts)

vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit() end, opts)
