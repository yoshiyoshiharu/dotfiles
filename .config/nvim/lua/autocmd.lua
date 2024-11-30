local autocmd = vim.api.nvim_create_autocmd

autocmd("TermOpen", {
	pattern = "*",
	command = ":startinsert",
})

vim.api.nvim_create_user_command('Ghpr', '!gh pr list --web -s all -S <q-args>', { nargs = 1 })

vim.api.nvim_create_user_command("Copypath", function()
  local absolute_file_path = vim.fn.expand("%:p")
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  local relative_file_path = string.sub(absolute_file_path, string.len(git_root) + 2)

  vim.fn.setreg("*", relative_file_path)
  vim.notify('Copied "' .. relative_file_path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("OpenLazyGit", function()
  local bufnr = vim.api.nvim_create_buf(false, true)
  local winnr = vim.api.nvim_open_win(bufnr, true, {
    relative = "editor",
    width = 10000,
    height = 10000,
    row = 10000,
    col = 10000,
  })

  vim.fn.termopen("lazygit", {
    on_exit = function(_, _, _)
      vim.api.nvim_win_close(winnr, true)
    end,
  })
end, {})

vim.api.nvim_create_autocmd("FileType", {
  desc = "launch lua-language-server",
  pattern = "lua",
  callback = function()
    vim.lsp.start({
      name = "lua_ls",
      cmd = { "lua-language-server" },
      root_dir = vim.fs.dirname(vim.fs.find({ ".luarc.json" }, { upward = true })[1]),
    })
  end
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Attach key mappings for LSP functionalities",
  callback = function ()
    vim.keymap.set('n', 'gd', '<cmd>:lua vim.lsp.buf.definition()<CR>')
    vim.keymap.set('n', 'gr', '<cmd>:lua vim.lsp.buf.references()<CR>')
  end
})
