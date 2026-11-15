vim.g.maplocalleader = " "
vim.g.mapleader = " "

vim.o.relativenumber = true
vim.o.number = true

vim.o.title = true

vim.o.cursorline = true
vim.o.wrap = false

vim.o.scrolloff = 10
vim.o.sidescrolloff = 8

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.showmatch = true
vim.o.cmdheight = 0
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.pumheight = 10
vim.o.pumblend = 10
vim.o.winborder = "single"
vim.o.laststatus = 3

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.foldmethod = "expr"
vim.o.foldlevel = 99
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.opt.fillchars:append("diff:╱")

vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = "cp -r"

vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.cache/nvim.undodir")
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 0

vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.clipboard:append("unnamedplus")

vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

vim.g.disable_autoformat = true

local ui2_opts = {
	enable = true,
	msg = {
		targets = {
			[""] = "msg",
			empty = "cmd",
			bufwrite = "msg",
			confirm = "cmd",
			emsg = "pager",
			echo = "msg",
			echomsg = "msg",
			echoerr = "pager",
			completion = "cmd",
			list_cmd = "pager",
			lua_error = "pager",
			lua_print = "msg",
			progress = "pager",
			rpc_error = "pager",
			quickfix = "msg",
			search_cmd = "cmd",
			search_count = "cmd",
			shell_cmd = "pager",
			shell_err = "pager",
			shell_out = "pager",
			shell_ret = "msg",
			undo = "msg",
			verbose = "pager",
			wildlist = "cmd",
			wmsg = "msg",
			typed_cmd = "cmd",
		},
		cmd = { height = 0.5 },
		dialog = { height = 0.5 },
		msg = { height = 0.3, timeout = 5000 },
		pager = { height = 0.5 },
	},
}
require("vim._core.ui2").enable(ui2_opts)
