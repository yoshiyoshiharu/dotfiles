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
          },
          experimental = {
            classRegex = {
              'class[:]\\s*"([^"]*)"',
              'class[:]\\s*\'([^"]*)\'',
            },
          },
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
