-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
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
  -- auto install above language parsers
  auto_install = true,
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.erb = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-embedded-template", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "master", -- default branch in case of git repo if different from master
    requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
  },
  filetype = "erb", -- if filetype does not match the parser name
}
