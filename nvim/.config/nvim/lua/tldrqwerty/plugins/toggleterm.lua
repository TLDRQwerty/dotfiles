local mapper = require('tldrqwerty.utils').mapper

local toggleterm = require('toggleterm');

local Terminal = require('toggleterm.terminal').Terminal;

toggleterm.setup{
  -- size can be a number or function which is passed the current terminal
  size = 20,
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single'
  }
}

local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true, float_opts = { border = "double" } })

function _lazygit_toggle()
  lazygit:toggle()
end

mapper('n', '<leader>tt', 'ToggleTerm')
mapper('n', '<leader>lg', 'lua _lazygit_toggle()')
