local cmp_nvim_lsp_status, _ = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig.solargraph.setup({
	cmd = { "solargraph", "stdio" },
	filetypes = { "ruby" },
})

lspconfig.rubocop.setup({
  cmd = { "rubocop", "--lsp" },
  filetypes = { "ruby" },
})

lspconfig.gopls.setup({})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})

lspconfig.tsserver.setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

lspconfig.emmet_language_server.setup({})

lspconfig.tailwindcss.setup {
  filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  cmd = { "tailwindcss-language-server", "--stdio" }
}

lspconfig.lua_ls.setup({})
