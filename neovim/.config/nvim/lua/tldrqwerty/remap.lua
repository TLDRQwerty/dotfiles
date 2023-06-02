vim.keymap.set('i', 'jj', '<esc>', { noremap = true })

vim.keymap.set('n', '<C-c>', ':nohl<cr>', { silent = true })

vim.keymap.set('n', '<leader>w', ':w<cr>', { silent = true })
vim.keymap.set('n', '<leader>q', ':q<cr>', { silent = true })

vim.keymap.set('n', '<C-t>l', ':tabr<cr>', { silent = true })
vim.keymap.set('n', '<C-t>h', ':tabl<cr>', { silent = true })
vim.keymap.set('n', '<C-t>j', ':tabp<cr>', { silent = true })
vim.keymap.set('n', '<C-t>k', ':tabn<cr>', { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
