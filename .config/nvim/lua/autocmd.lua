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

-- lua lsp setting
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

-- ruby lsp setting
vim.api.nvim_create_autocmd("FileType", {
  desc = "launch ruby language server",
  pattern = "ruby",
  callback = function()
    vim.lsp.start({
      name = "rubocop",
      cmd = { "rubocop", "--lsp" },
      root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
    })
    vim.lsp.start({
      name = "solargraph",
      cmd = { "solargraph", "stdio" },
      root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
    })
  end
})

-- html lsp setting
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "eruby,html",
  callback = function()
    vim.lsp.start({
      cmd = { "emmet-language-server", "--stdio" },
      root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
      init_options = {
        includeLanguages = {},
        excludeLanguages = {},
        extensionsPath = {},
        preferences = {},
        showAbbreviationSuggestions = true,
        showExpandedAbbreviation = "always",
        showSuggestionsAsSnippets = false,
        syntaxProfiles = {},
        variables = {},
      },
    })
  end,
})

-- tailwindcss lsp setting
vim.api.nvim_create_autocmd("FileType", {
  desc = "launch tailwindcss language server",
  pattern = "eruby,html",
  callback = function()
    vim.lsp.start({
      name = "tailwindcss_ls",
      cmd = { "tailwindcss-language-server", "--stdio" },
      root_dir = vim.fs.dirname(vim.fs.find({ "tailwind.config.js", "package.json", ".git" }, { upward = true })[1]),
      settings = {
        tailwindCSS = {
          validate = true,
          lint = {
            cssConflict = "warning",
            invalidApply = "error",
            invalidScreen = "error",
            invalidVariant = "error",
            invalidConfigPath = "error",
            invalidTailwindDirective = "error",
            recommendedVariantOrder = true,
          },
          includeLanguages = {
            eruby = 'erb',
          }
        }
      }
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
