return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim",  opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "simrat39/rust-tools.nvim",
    },

    ---@class PluginLspOpts
    opts = {
      capabilities = {},
      servers = {
        astro = {},
        tsserver = {},
        intelephense = {
          init_options = {
            licenceKey = os.getenv("INTELEPHENSE_KEY"),
          },
        },
        tailwindcss = {},
        cssls = {},
        cssmodules_ls = {},
        rust_analyzer = {},
        eslint = {},
        gopls = {},
        htmx = {},
        svelte = {},
        bashls = {},
        lua_ls = {
          ---@type LazyKeysSpec[]
          -- keys = {},
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
      setup = {
        rust_analyzer = function(_, opts)
          local rt = require("rust-tools")
          rt.setup({
            server = opts
          })
        end,
      }
    },

    ---@param opts PluginLspOpts
    config = function(_, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local o = { buffer = ev.buf, silent = true }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, o)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, o)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, o)
          vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, o)
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, o)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, o)
          vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, o)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, o)
          vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
          end, o)
          vim.keymap.set("n", "dn", vim.diagnostic.goto_next, o)
          vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, o)
          vim.keymap.set("n", "d<S-n>", function()
            vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
          end, o)
          vim.keymap.set("n", "d<S-p>", function()
            vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
          end, o)
          vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, o)

          return ret
        end
      })
      local servers = opts.servers
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_nvim_lsp.default_capabilities(),
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        end

        require("lspconfig")[server].setup(server_opts)
      end

      local mlsp = require("mason-lspconfig")
      local all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          if not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
    end
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      }
    }
  }
}
