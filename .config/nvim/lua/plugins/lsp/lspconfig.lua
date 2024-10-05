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

lspconfig.emmet_language_server.setup({})

lspconfig.lua_ls.setup({})
