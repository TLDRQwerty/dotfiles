require('impatient').enable_profile()

require('tldrqwerty.set')
require('tldrqwerty.autocmd')
require('tldrqwerty.remap')
require('tldrqwerty.plugins')

vim.notify = function(_, m, l, o)
  local notify = require 'notify'
  vim.notify = notify
  notify(_, m, l, o)
end
