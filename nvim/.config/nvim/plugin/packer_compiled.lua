-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/qwerty/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/qwerty/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/qwerty/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/qwerty/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/qwerty/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Navigator.nvim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!tldrqwerty.plugins.navigator\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/Navigator.nvim"
  },
  ["TrueZen.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0 tldrqwerty.plugins.true-zen\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/TrueZen.nvim"
  },
  chadtree = {
    config = { "\27LJ\1\2;\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0 tldrqwerty.plugins.chadtree\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/chadtree"
  },
  ["diagnosticls-nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/diagnosticls-nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\28tldrqwerty.git.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    config = { '\27LJ\1\2=\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0"tldrqwerty.plugins.kommentary\frequire\0' },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["kosmikoa.nvim"] = {
    config = { "\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/kosmikoa.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2:\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\31tldrqwerty.plugins.lualine\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["material.nvim"] = {
    config = { "\27LJ\1\2d\0\0\2\0\a\0\n4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0>\0\1\1G\0\1\0\bset\rmaterial\frequire\15deep ocean\19material_style\6g\bvim\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2A\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0&tldrqwerty.plugins.nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24tldrqwerty.lsp.comp\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24tldrqwerty.lsp.init\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    config = { '\27LJ\1\2=\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0"tldrqwerty.plugins.toggleterm\frequire\0' },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\0029\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\30tldrqwerty.lsp.treesitter\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\1\2B\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0'tldrqwerty.plugins.nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24tldrqwerty.git.octo\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["presence.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0 tldrqwerty.plugins.presence\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0 tldrqwerty.plugins.surround\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!tldrqwerty.plugins.telescope\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\1\2:\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\27colorscheme tokyonight\bcmd\bvim\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27tldrqwerty.lsp.trouble\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-polyglot"] = {
    config = { "\27LJ\1\2F\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0' let g:javascript_plugin_flow = 1 \bcmd\bvim\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!tldrqwerty.plugins.which-key\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["zephyr-nvim"] = {
    config = { "\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: surround.nvim
time([[Config for surround.nvim]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0 tldrqwerty.plugins.surround\frequire\0", "config", "surround.nvim")
time([[Config for surround.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\0029\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\30tldrqwerty.lsp.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!tldrqwerty.plugins.which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: zephyr-nvim
time([[Config for zephyr-nvim]], true)
try_loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0", "config", "zephyr-nvim")
time([[Config for zephyr-nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27tldrqwerty.lsp.trouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\31tldrqwerty.plugins.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring('\27LJ\1\2=\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0"tldrqwerty.plugins.kommentary\frequire\0', "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: TrueZen.nvim
time([[Config for TrueZen.nvim]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0 tldrqwerty.plugins.true-zen\frequire\0", "config", "TrueZen.nvim")
time([[Config for TrueZen.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\1\2B\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0'tldrqwerty.plugins.nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!tldrqwerty.plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
try_loadstring("\27LJ\1\2d\0\0\2\0\a\0\n4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0>\0\1\1G\0\1\0\bset\rmaterial\frequire\15deep ocean\19material_style\6g\bvim\0", "config", "material.nvim")
time([[Config for material.nvim]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24tldrqwerty.lsp.comp\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!tldrqwerty.plugins.navigator\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: vim-polyglot
time([[Config for vim-polyglot]], true)
try_loadstring("\27LJ\1\2F\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0' let g:javascript_plugin_flow = 1 \bcmd\bvim\0", "config", "vim-polyglot")
time([[Config for vim-polyglot]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2A\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0&tldrqwerty.plugins.nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\27colorscheme tokyonight\bcmd\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24tldrqwerty.lsp.init\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\28tldrqwerty.git.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: kosmikoa.nvim
time([[Config for kosmikoa.nvim]], true)
try_loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0", "config", "kosmikoa.nvim")
time([[Config for kosmikoa.nvim]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring('\27LJ\1\2=\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0"tldrqwerty.plugins.toggleterm\frequire\0', "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: chadtree
time([[Config for chadtree]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0 tldrqwerty.plugins.chadtree\frequire\0", "config", "chadtree")
time([[Config for chadtree]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24tldrqwerty.git.octo\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0 tldrqwerty.plugins.presence\frequire\0", "config", "presence.nvim")
time([[Config for presence.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
