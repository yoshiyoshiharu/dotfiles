local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

autocmd("TermOpen", {
	pattern = "*",
	command = ":startinsert",
})

vim.api.nvim_create_user_command('Ghpr', '!gh pr list --web -s all -S <q-args>', { nargs = 1 })

vim.api.nvim_create_user_command("Copypath", function()
  local absolute_file_path = vim.fn.expand("%:p")
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  local relative_file_path = string.sub(absolute_file_path, string.len(git_root) + 2)

  vim.fn.setreg("*", relative_file_path) -- Copy to system clipboard register
  vim.notify('Copied "' .. relative_file_path .. '" to the clipboard!')
end, {})
