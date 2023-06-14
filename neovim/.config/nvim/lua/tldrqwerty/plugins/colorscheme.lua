return {
  {
    "shaunsingh/oxocarbon.nvim",
    config = function()
      vim.opt.background = "dark" -- set this to dark or light
      vim.cmd.colorscheme "oxocarbon"
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "jacoborus/tender.vim",
  },
  {
    "Lokaltog/monotone.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
  },
  {
    "Shatur/neovim-ayu",
  },
  {
    "JoosepAlviste/palenightfall.nvim",
  },
  {
    "savq/melange-nvim",
  },
  {
    "jesseleite/nvim-noirbuddy",
    dependencies = { "tjdevries/colorbuddy.nvim" },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavor = "mocha",
      })
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },
}
