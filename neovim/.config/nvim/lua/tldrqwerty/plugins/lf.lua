return {
  {
    "lmburns/lf.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" },
    keys = {
      {
        "<leader>lf",
        function()
          require("lf").start(
          -- nil, -- this is the path to open Lf (nil means CWD)
          -- this argument is optional see `.start` below
          {
            -- Pass options (if any) that you would like
            dir = "", -- directory where `lf` starts ('gwd' is git-working-directory)
            direction = "float", -- window type: float horizontal vertical
            border = "double", -- border kind: single double shadow curved
            height = 0.80, -- height of the *floating* window
            width = 0.85, -- width of the *floating* window
            mappings = true, -- whether terminal buffer mapping is enabled
          })
        end,
      }
    },
    opts = {
      escape_quit = false,
      border = "rounded",
    },
  }
}
