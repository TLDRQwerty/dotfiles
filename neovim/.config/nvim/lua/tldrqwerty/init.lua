local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('tldrqwerty.config.options')
require('tldrqwerty.config.keymaps')
require('tldrqwerty.config.autocmds')

require("lazy").setup("tldrqwerty.plugins")
