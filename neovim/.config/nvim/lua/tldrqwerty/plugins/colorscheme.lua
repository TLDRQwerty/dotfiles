return {
  {
    "shaunsingh/oxocarbon.nvim",
    lazy = true
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
  },
  {
    "jacoborus/tender.vim",
    lazy = true,
  },
  {
    "Lokaltog/monotone.nvim",
    lazy = true,
    dependencies = {
      "rktjmp/lush.nvim",
    },
  },
  {
    "Shatur/neovim-ayu",
    lazy = true,
  },
  {
    "JoosepAlviste/palenightfall.nvim",
    lazy = true,
  },
  {
    "savq/melange-nvim",
    lazy = true,
  },
  {
    "jesseleite/nvim-noirbuddy",
    dependencies = { "tjdevries/colorbuddy.nvim" },
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavor = "mocha",
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
