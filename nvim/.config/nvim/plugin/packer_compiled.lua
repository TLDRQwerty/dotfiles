-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors = pcall(function()

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
  ["ariake-vim-colors"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/ariake-vim-colors"
  },
  aurora = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/aurora"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["blue-moon"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/blue-moon"
  },
  ["boo-colorscheme-nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/boo-colorscheme-nvim"
  },
  chadtree = {
    config = { "\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/chadtree"
  },
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/colorbuddy.vim"
  },
  ["diagnosticls-nvim"] = {
    config = { "\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/diagnosticls-nvim"
  },
  ["dracula.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/dracula.nvim"
  },
  edge = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/edge"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gloombuddy = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/gloombuddy"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\1\2:\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\31tldrqwerty.plugins.lspsaga\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-compe"] = {
    config = { '\27LJ\1\2=\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0"tldrqwerty.plugins.nvim-compe\frequire\0' },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-highlite"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nvim-highlite"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27tldrqwerty.plugins.lsp\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-rdark"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nvim-rdark"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/oceanic-next"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\28tldrqwerty.plugins.octo\frequire\0" },
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  pinkmare = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/pinkmare"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["seoul256.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/seoul256.nvim"
  },
  ["solarized.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/solarized.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/vim-prettier"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/qwerty/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\28tldrqwerty.plugins.octo\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27tldrqwerty.plugins.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\31tldrqwerty.plugins.lspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: chadtree
time([[Config for chadtree]], true)
try_loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0", "config", "chadtree")
time([[Config for chadtree]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring('\27LJ\1\2=\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0"tldrqwerty.plugins.nvim-compe\frequire\0', "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: diagnosticls-nvim
time([[Config for diagnosticls-nvim]], true)
try_loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0", "config", "diagnosticls-nvim")
time([[Config for diagnosticls-nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: ".v:exception | echom "Please check your config for correctness" | echohl None')
end
