vim.g.mapleader  = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("t", "<Esc>", "<C-\\><C-n>")
keymap.set("i", "jj", "<ESC>")
keymap.set("n", "<C-q>", ":q<cr>")
keymap.set("i", "<C-q>", "<ESC>:q<cr>")
keymap.set("t", "<C-q>", "<ESC>:q<cr>")
keymap.set("n", "<leader>h", "^")
keymap.set("n", "<leader>l", "$")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- nvim-tree
keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>") -- toggle file explorer

-- toggle term
keymap.set("n", "<leader>te", ":ToggleTerm<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>lg", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type

