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
keymap.set("v", "<leader>h", "^")
keymap.set("v", "<leader>l", "$")
keymap.set("v", "<C-c>", "y")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
keymap.set("v", "x", '"_x')

-- window management
keymap.set("n", "<leader>sl", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sj", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- window size
keymap.set("n", "<C-=>", "<C-w>5>")
keymap.set("n", "<C-_>", "<C-w>5<")

-- nvim-tree
keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n","<leader>fc", "<cmd>Telescope frecency<cr>") -- find open buffers
keymap.set("n", "<leader>fl", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fg", "<cmd>Telescope git_bcommits<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>ft", "<cmd>Telescope<cr>") -- find string in current working directory as you type

-- git
keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>") -- open git status
