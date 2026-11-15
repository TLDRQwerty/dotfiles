local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>w", ":w<CR>", opts)
keymap.set("n", "<leader>q", ":q<CR>", opts)
keymap.set("i", "jj", "<esc>", opts)

