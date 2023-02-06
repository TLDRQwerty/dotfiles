local safe_require = require('tldrqwerty.utils').safe_require

local impatient = safe_require('impatient')
if impatient then
  require('impatient').enable_profile()
end

require('tldrqwerty.set')
require('tldrqwerty.autocmd')
require('tldrqwerty.disable_builtins')
require('tldrqwerty.remap')
require('tldrqwerty.plugins')

require('tldrqwerty.plugins.lsp')

-- vim.notify = function(_, m, l, o)
--   local notify = require 'notify'
--   vim.notify = notify
--   notify(_, m, l, o)
-- end
