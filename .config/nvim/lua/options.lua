local opt = vim.opt

opt.mouse = "a"
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = false
opt.wrap = false
opt.ignorecase = false
opt.smartcase = true
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "100"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")
opt.swapfile = false
opt.smartindent = true
opt.laststatus = 3
