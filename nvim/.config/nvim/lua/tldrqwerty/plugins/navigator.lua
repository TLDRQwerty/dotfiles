local mapper = require('tldrqwerty.utils').mapper;

require('Navigator').setup()

mapper('n', '<C-h>', ':lua require("Navigator").left()')
mapper('n', '<C-k>', ':lua require("Navigator").up()')
mapper('n', '<C-l>', ':lua require("Navigator").right()')
mapper('n', '<C-j>', ':lua require("Navigator").down()')
