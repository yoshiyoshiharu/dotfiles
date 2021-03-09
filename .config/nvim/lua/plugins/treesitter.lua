local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  highlight = {
    enable = true,
  },
  endwise = {
      enable = true,
  },
  indent = { enable = true },
  autotag = { enable = true },
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
    "ruby"
  },
  auto_install = true,
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.erb = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
    files = {"src/parser.c"},
    branch = "master",
    requires_generate_from_grammar = true,
  },
  filetype = "erb",
}
