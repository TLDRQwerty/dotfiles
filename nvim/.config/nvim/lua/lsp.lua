local nvim_lsp = require('nvim_lsp')
local lsp_status = require('lsp-status')
local completion = require('completion')
local diagnostic = require('diagnostic')

lsp_status.config {
  kind_labels = vim.g.completion_customize_lsp_label,
  select_symbol = function(cursor_pos, symbol)
    if symbol.valueRange then
      local value_range = {
        ['start'] = {character = 0, line = vim.fn.byte2line(symbol.valueRange[1])},
        ['end'] = {character = 0, line = vim.fn.byte2line(symbol.valueRange[2])}
      }

      return require('lsp-status/util').in_range(cursor_pos, value_range)
    end
  end
}

lsp_status.register_progress()

local function make_on_attach(config)
  return function(client)
    if config.before then config.before(client) end

    lsp_status.on_attach(client)
    completion.on_attach(client)
    diagnostic.on_attach(client)

    local mapper = function(mode, key, result)
      vim.fn.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
    end

    mapper('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    mapper('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    mapper('n', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    mapper('n', 'gTD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    mapper('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    mapper('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

    mapper('n', 'dn', '<cmd>NextDiagnostic<CR>')
    mapper('n', 'dp', '<cmd>PrevDiagnostic<CR>')
    mapper('n', 'E', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')

    if config.after then config.after(client) end
  end
end

local servers = {
  clangd = {
    cmd = {"clangd", "--background-index"},
    init_options = {
      clangdFileStatus = true
    },
    callbacks = lsp_status.extensions.clangd.setup(),
    capabilities = lsp_status.capabilities,
  },
  cssls = {
    filetypes = {"css", "scss", "less", "sass"},
    root_dir = nvim_lsp.util.root_pattern("package.json", ".git"),
  },
  html = {
    cmd = {'html-languageserver', '--stdio'},
    root_pattern = nvim_lsp.util.root_pattern('.git'),
  },
  jsonls = {
    cmd = {'json-languageserver', '--stdio'}
  },
  pyls_ms = {
    cmd = {'mspyls'},
    callbacks = lsp_status.extensions.pyls_ms.setup(),
    settings = {
      python = {
        jediEnabled = false,
        analysis = {cachingLevel = 'Library'},
        formatting = {provider = 'yapf'},
        venvFolders = {"envs", ".pyenv", ".direnv", ".cache/pypoetry/virtualenvs"},
        workspaceSymbols = {enabled = true}
      }
    },
    root_dir = function(fname)
      return nvim_lsp.util.root_pattern('pyproject.toml', 'setup.py', 'setup.cfg',
      'requirements.txt', 'mypy.ini', '.pylintrc', '.flake8rc',
      '.gitignore')(fname)
      or nvim_lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end
  },
  sumneko_lua = {
    cmd = {'lua-language-server'},
    filetypes = {'lua'},
    settings = {
      Lua = {
        diagnostics = {globals = {'vim'}},
        completion = {keywordSnippet = 'Disable'},
        runtime = {version = 'LuaJIT'}
      }
    },
  },

  tsserver = {
    cmd = {'typescript-language-server', '--stdio'},
    filetypes = {'typescript', 'typescriptreact'},
    root_dir = nvim_lsp.util.root_pattern('package.json', 'tsconfig.json', '.git'),
  },
  vimls = {
    cmd = {'vim-language-server', '--stdio'},
    filetypes = {'vim'},
  },
  gopls = {
    cmd = {'gopls'},
    filetypes = {'go'},
    root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod')
  },
  intelephense = {
    cmd = {'intelephense', '--stdio'},
    filetypes = {'php'},
    root_dir = nvim_lsp.util.root_pattern('.git')
  },
  bashls = {
    cmd = {'bash-language-server', 'start'},
    filetypes = {'sh', 'zsh'},
    root_dir = nvim_lsp.util.root_pattern('.git')
  },
}

for server, config in pairs(servers) do
  config.on_attach = make_on_attach(config)
  nvim_lsp[server].setup(config)
end
