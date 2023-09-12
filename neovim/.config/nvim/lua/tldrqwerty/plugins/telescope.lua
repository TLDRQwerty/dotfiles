return {
  {
    "nvim-telescope/telescope.nvim",
    tag= "0.1.3",
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "nvim-telescope/telescope-github.nvim",
        dependencies = { "telescope.nvim" },
        config = function()
          require("telescope").load_extension("gh")
        end,
        keys = {
          {
            "<leader>fgi",
            function()
              require('telescope').extensions.gh.issues()
            end,
          },
          {
            "<leader>fgp",
            function()
              require('telescope').extensions.gh.pull_request()
            end,
          }
        }
      }
    },
    keys = {
      {
        "<leader>fF",
        function()
          require("telescope.builtin").find_files({})
        end,
      },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").git_files({})
        end
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({})
        end
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers({})
        end
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags({})
        end
      },


      {
        "<leader>fls",
        function()
          require("telescope.builtin").lsp_document_symbols({})
        end
      },
      {
        "<leader>flw",
        function()
          require("telescope.builtin").lsp_workspace_symbols({})
        end
      },
      {
        "<leader>fld",
        function()
          require("telescope.builtin").diagnostics({})
        end
      },
      {
        "<leader>flr",
        function()
          require("telescope.builtin").lsp_references({})
        end
      },
      {
        "<leader>fld",
        function()
          require("telescope.builtin").lsp_definitions({})
        end
      },

      {
        "<leader>fgb",
        function()
          require("telescope.builtin").git_branches({})
        end
      },
      {
        "<leader>fgc",
        function()
          require("telescope.builtin").git_commits({})
        end
      },
      {
        "<leader>fgbc",
        function()
          require("telescope.builtin").git_bcommits({})
        end
      },
    },
    opts = {
      defaults = {
        layout_strategy = "flex",
        layout_config = { anchor = "N" },
        scroll_strategy = "cycle",
        initial_mode = "insert",
      },
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      pickers = {
        buffers = {
          ignore_current_buffer = true,
          -- sort_mru = true,
          sort_lastused = true,
          previewer = false,
        },
      },
    }
  },
}
