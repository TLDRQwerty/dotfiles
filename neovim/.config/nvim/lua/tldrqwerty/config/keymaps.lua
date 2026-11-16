local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>w", ":w<CR>", opts)
keymap.set("n", "<leader>q", ":q<CR>", opts)
keymap.set("i", "jj", "<esc>", opts)

keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>", opts)

keymap.set("n", "<C-t>l", "<cmd>tabr<CR>", opts)
keymap.set("n", "<C-t>h", "<cmd>tabl<CR>", opts)
keymap.set("n", "<C-t>j", "<cmd>tabp<CR>", opts)
keymap.set("n", "<C-t>k", "<cmd>tabn<CR>", opts)

keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word under cursor" })

