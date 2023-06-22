local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

autocmd("TermOpen", {
	pattern = "*",
	command = ":startinsert",
})

vim.api.nvim_create_user_command('Ghpr', '!gh pr list --web -s all -S <q-args>', { nargs = 1 })
