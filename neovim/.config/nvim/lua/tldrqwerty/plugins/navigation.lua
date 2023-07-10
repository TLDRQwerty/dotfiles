return {
  {
    "aserowy/tmux.nvim",
    opts = {
      copy_sync = {
        enable = true,
      },
      navigation = {
        enable_default_keybindings = true,
      },
      resize = {
        enable_default_keybindings = true,
      },
    }
  },
  {
    "lmburns/lf.nvim",
    dependencies = { "plenary.nvim", "toggleterm.nvim" },
    otps = {
      escape_quit = false,
      border = "rounded",
    },
    keys = {
      {
        "<leader>lf",
        function()
          require("lf").start(
          -- nil, -- this is the path to open Lf (nil means CWD)
          -- this argument is optional see `.start` below
            {
              -- Pass options (if any) that you would like
              dir = "",            -- directory where `lf` starts ('gwd' is git-working-directory)
              direction = "float", -- window type: float horizontal vertical
              border = "double",   -- border kind: single double shadow curved
              mappings = true,     -- whether terminal buffer mapping is enabled
            })
        end
      }
    }
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {},
    keys = {
      {
        '<leader>lg',
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
          function _lazygit_toggle()
            lazygit:toggle()
          end

          _lazygit_toggle()
        end
      },
      {
        '<leader>tf',
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local float_terminal = Terminal:new({
            direction = "float",
          })
          function _float_terminal_toggle()
            float_terminal:toggle()
          end

          _float_terminal_toggle()
        end
      },
      {
        '<leader>tt',
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local tab_terminal = Terminal:new({
            direction = "tab",
          })
          function _tab_terminal_toggle()
            tab_terminal:toggle()
          end

          _tab_terminal_toggle()
        end
      },
      {
        '<leader>tv',
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local vertical_terminal = Terminal:new({
            direction = "vertical",
          })
          function _vertical_terminal_toggle()
            vertical_terminal:toggle()
          end

          _vertical_terminal_toggle()
        end
      },
      {
        '<leader>ts',
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local terminal = Terminal:new({})
          function _horizontal_terminal_toggle()
            terminal:toggle()
          end

          _horizontal_terminal_toggle()
        end
      }
    }
  },
}
