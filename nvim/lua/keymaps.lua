vim.g.mapleader  = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("t", "<Esc>", "<C-\\><C-n>")
keymap.set("i", "jj", "<ESC>:w<cr>")
keymap.set("i", "<ESC>", "<ESC>:w<cr>")
keymap.set("i", "<C-c>", "<ESC>:w<cr>")
keymap.set("i", "<C-f>", "<Right>")
keymap.set("i", "<C-b>", "<Left>")
keymap.set("i", "<C-p>", "<Up>")
keymap.set("i", "<C-n>", "<Down>")
keymap.set("i", "<C-a>", "<C-o>^")
keymap.set("i", "<C-e>", "<C-o>$")

keymap.set("n", "<C-q>", ":q<cr>")
keymap.set("i", "<C-q>", "<ESC>:q<cr>")
keymap.set("t", "<C-q>", "<ESC>:q<cr>")
keymap.set("n", "<leader>h", "^")
keymap.set("n", "<leader>l", "$")
keymap.set("n", "<leader>w", "<C-w>x")
keymap.set("n", "cp", ":Copypath<cr>")
keymap.set("n", "<CR>", "a<Return><Esc>^k")
keymap.set("n", "<leader>no", ":nohl<CR>")
keymap.set("n", "<leader>gr", ":lua print(vim.inspect(vim.treesitter.get_captures_at_cursor(0)))<CR>")
keymap.set("n", "<leader>op", ":Octo pr ")
keymap.set("n", "<leader>or", ":Octo review ")
keymap.set("v", "<leader>h", "^")
keymap.set("v", "<leader>l", "$")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
keymap.set("v", "x", '"_x')

-- window management
keymap.set("n", "<leader>sl", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sj", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- window size
keymap.set("n", "<leader>=", "<C-w>15>")
keymap.set("n", "<leader>-", "<C-w>15<")

-- vim maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>tr", ":NvimTreeRefresh<CR>") -- toggle file explorer
keymap.set("n", "<leader>tx", ":NvimTreeCollapse<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<C-p>", "<cmd>Telescope find_files hiddden=true<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n","<leader>fc", "<cmd>Telescope frecency<cr>") -- find open buffers
keymap.set("n", "<C-f>", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>") -- find string in current working directory as you type
keymap.set("n", "<leader>fg", "<cmd>Telescope git_bcommits<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>ft", "<cmd>Telescope<cr>") -- find string in current working directory as you type

-- git
keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>") -- open git status

-- lsp
keymap.set("n", "<leader>te", ":Lspsaga term_toggle<CR>") -- code action
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>") -- go to definition
keymap.set("n", "go", "<cmd>Lspsaga goto_definition<CR>") -- go to definition
keymap.set("n", "rn", "<cmd>Lspsaga rename<CR>") -- rename

-- Diffview
keymap.set("n", "<leader>dv", ":DiffviewOpen") -- open diffview

-- coplilot
keymap.set("n", "<leader>cp", ":Copilot panel<CR>") -- open copilot panel
