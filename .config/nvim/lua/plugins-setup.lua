local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "yoshiyoshiharu/minitest.nvim",
    config = function()
      require('minitest').setup({ command = 'docker compose exec web rails test' })
    end
  },
  "nvim-lua/plenary.nvim",
  "tomasr/molokai",
  "sainnhe/sonokai",

  "szw/vim-maximizer",
  "nvim-tree/nvim-tree.lua",
  "tpope/vim-surround",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-frecency.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-live-grep-args.nvim",
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  "onsails/lspkind.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "jayp0521/mason-null-ls.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  },
  'RRethy/nvim-treesitter-endwise',
  "windwp/nvim-autopairs",
  { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
  "lewis6991/gitsigns.nvim",
  "petertriho/nvim-scrollbar",
  "github/copilot.vim",
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    opts = {
      debug = true,
    },
  },
  "lukas-reineke/indent-blankline.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-rails",
  "sindrets/diffview.nvim",
  { 'akinsho/git-conflict.nvim', version = "*", config = true },
  'kevinhwang91/nvim-bqf',
  'stevearc/qf_helper.nvim',
  { 'romgrk/barbar.nvim' },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'pbogut/vim-dadbod-ssh', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  'ruifm/gitlinker.nvim',
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
})
