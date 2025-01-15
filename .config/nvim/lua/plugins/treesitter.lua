return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufRead",
  dependencies = {
    'RRethy/nvim-treesitter-endwise',
  },
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function()
    require("nvim-treesitter.configs").setup({
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

    require("nvim-treesitter.parsers").get_parser_configs().embedded_template = {
      install_info = {
        url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
        files = {"src/parser.c"},
        branch = "master",
        requires_generate_from_grammar = true,
      },
      filetype = "erb",
    }
  end
}
