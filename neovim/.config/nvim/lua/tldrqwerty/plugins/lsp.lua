local function config()
  local lsp = require('lsp-zero')

  lsp.preset('recommended')

  lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'intelephense',
  })

  local cmp = require('cmp')
  local cmp_select = { behavior = cmp.SelectBehavior.Select }
  local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  })

  lsp.setup_nvim_cmp({ mapping = cmp_mappings, window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  } })

  lsp.nvim_workspace()

  lsp.configure('tailwindcss', {
    settings = {
      tailwindCSS = {
        classAttributes = { "class", "className", "classList", "ngClass", "style" },
        experimental = {
          classRegex = {
            "tw`([^`]*)",
            "tw=\"([^\"]*)",
            "tw={\"([^\"}]*)",
            "tw\\.\\w+`([^`]*)",
            "tw\\(.*?\\)`([^`]*)",
            "className\"([^\"]*)",
          }
        }
      }
    }
  })

  lsp.configure('intelephense', {
    init_options = {
      licenceKey = os.getenv('INTELEPHENSE_KEY')
    },
  })

  lsp.configure('astro', {
    filetypes = { 'astro' }
  })

  lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "dn", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ timeout_ms = 2000 }) end, opts)
  end)

  lsp.setup()
end

local function setup()
end

return {
  config = config,
  setup = setup,
}
