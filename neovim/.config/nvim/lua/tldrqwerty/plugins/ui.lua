return {
  {
    "gelguy/wilder.nvim",
    opts = {
      modes = { ":", "/", "?" },
    },
  },

  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = {
      "catppuccin/nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "catppuccin/nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "catppuccin",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    opts = {},
  },
}
