local function config()
  vim.g.lf_netrw = 1
  require("lf").setup({
    escape_quit = false,
    border = "rounded",
  })

  vim.api.nvim_set_keymap('n', '<leader>lf', ':Lf<cr>', { silent = true });
end

return { config = config }
