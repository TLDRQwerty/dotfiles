local keymap = vim.keymap

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

keymap.set('i', "jj", "<esc>", opts)
keymap.set('n', "<leader>w", ":w<cr>", opts)
keymap.set('n', "<leader>q", ":q<cr>", opts)

keymap.set('n', '<C-t>l', ':tabr<cr>', opts)
keymap.set('n', '<C-t>h', ':tabl<cr>', opts)
keymap.set('n', '<C-t>j', ':tabp<cr>', opts)
keymap.set('n', '<C-t>k', ':tabn<cr>', opts)

keymap.set('n', '<C-c>', ':nohl<cr>', opts)

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
