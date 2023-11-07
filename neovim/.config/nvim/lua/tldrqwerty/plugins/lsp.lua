return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "folke/neodev.nvim",
        opts = {},
      },
      {
        "simrat39/rust-tools.nvim",
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            "tsserver",
            "lua_ls",
            "tailwindcss",
            "grammarly",
            "astro",
            "svelte",
            "intelephense",
            "eslint",
            "sqlls",
          },
          automatic_installation = true,
        },
        dependencies = {
          {
            "williamboman/mason.nvim",
            opts = {},
          },
        },
      },
      {
        "github/copilot.vim",
      },
      {
        "hrsh7th/nvim-cmp",
        opts = function()
          local cmp = require("cmp")
          local cmp_select = { behavior = cmp.SelectBehavior.Select }
          cmp.setup({
            snippet = {
              -- REQUIRED - you must specify a snippet engine
              expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
              end,
            },
            window = {
              completion = cmp.config.window.bordered(),
              documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
              ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
              ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
              ["<C-y>"] = cmp.mapping.confirm({ select = true }),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<C-b>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-e>"] = cmp.mapping.abort(),
              ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
              -- ["<Tab>"] = cmp.mapping(function(fallback)
              -- 	if cmp.visible() then
              -- 		cmp.select_next_item()
              -- 	else
              -- 		fallback()
              -- 	end
              -- end, { "i", "s" }),
              -- ["<S-Tab>"] = cmp.mapping(function(fallback)
              -- 	if cmp.visible() then
              -- 		cmp.select_prev_item()
              -- 	elseif require("luasnip").jumpable(-1) then
              -- 		require("luasnip").jump(-1)
              -- 	else
              -- 		fallback()
              -- 	end
              -- end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
              { name = "nvim_lsp" },
              { name = "vsnip" }, -- For vsnip users.
              -- { name = 'luasnip' }, -- For luasnip users.
              -- { name = 'ultisnips' }, -- For ultisnips users.
              -- { name = 'snippy' }, -- For snippy users.
            }, {
              { name = "buffer" },
            }),
          })

          cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
              { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
              { name = "buffer" },
            }),
          })
        end,
      },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        opts = {
          color_square_width = 2,
        },
      },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
    opts = {
      inlay_hints = { enabled = false },
    },
    setup = {},
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.intelephense.setup({
        init_options = {
          licenceKey = os.getenv("INTELEPHENSE_KEY"),
        },
      })
      local rt = require("rust-tools")
      rt.setup()
      lspconfig.tsserver.setup({
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })
      lspconfig.grammarly.setup({})
      lspconfig.tailwindcss.setup({
        settings = {
          tailwindCSS = {
            classAttributes = { "class", "className", "classList", "ngClass", "style" },
            experimental = {
              classRegex = {
                "tw`([^`]*)",
                'tw="([^"]*)',
                'tw={"([^"}]*)',
                "tw\\.\\w+`([^`]*)",
                "tw\\(.*?\\)`([^`]*)",
                'className"([^"]*)',
              },
            },
          },
        },
      })
      lspconfig.svelte.setup({
        settings = {
          svelte = {
            plugin = {
              svelte = {
                enable = true,
              },
            },
          },
        },
      })
      lspconfig.astro.setup({})
      lspconfig.eslint.setup({})
      lspconfig.sourcekit.setup({})
      lspconfig.sqlls.setup({})
    end,
    init = function()
      vim.api.nvim_create_autocmd({ "LspAttach" }, {
        callback = function(args)
          local buffer = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint(buffer, false)
          end
        end,
      })
      -- vim.api.nvim_create_autocmd({ "BufLeave" }, {
      --   callback = function()
      --     vim.lsp.inlay_hint(0, false)
      --   end,
      -- })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, opts)
          -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
          -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
          -- vim.keymap.set("n", "<space>wl", function()
          --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          -- end, opts)
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)

          vim.keymap.set("n", "dn", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "d<S-n>", function()
            vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
          end, opts)
          vim.keymap.set("n", "d<S-p>", function()
            vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
          end, opts)
          vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        end,
      })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lspconfig",
    },
    opts = function()
      local null_ls = require("null-ls")
      local null_fmt = null_ls.builtins.formatting
      local null_diag = null_ls.builtins.diagnostics
      local null_act = null_ls.builtins.code_actions

      local sources = {
        null_diag.phpcs.with({
          prefer_local = "bin",
        }),
        null_diag.phpstan,

        null_fmt.prettier.with({
          prefer_local = "node_modules/.bin",
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "astro", "svelte" },
        }),
        null_fmt.rustfmt,
        null_fmt.stylua,
        null_fmt.trim_whitespace,
      }
      null_ls.setup({
        sources = sources,
      })
    end,
  },
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    config = function()
      require("tabnine").setup({
        disable_auto_comment = true,
        accept_keymap = "<Tab>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt" },
        log_file_path = nil, -- absolute path to Tabnine log file
      })
    end,
  },
}
