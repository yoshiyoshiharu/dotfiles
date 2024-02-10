local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "nvim-lua/plenary.nvim",
  "tomasr/molokai",
  "sainnhe/sonokai",

  "christoomey/vim-tmux-navigator",
  "szw/vim-maximizer",
  "nvim-tree/nvim-tree.lua",
  "tpope/vim-surround",
  "inkarkat/vim-ReplaceWithRegister",
  'pocco81/auto-save.nvim',
  "numToStr/Comment.nvim",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  "nvim-telescope/telescope-frecency.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-live-grep-args.nvim",
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
  "akinsho/toggleterm.nvim",
  "petertriho/nvim-scrollbar",
  "github/copilot.vim",
  "lukas-reineke/indent-blankline.nvim",
  {
    "tversteeg/registers.nvim",
    config = function()
      require("registers").setup()
    end,
  },
  "tpope/vim-fugitive",
  "sindrets/diffview.nvim",
  'akinsho/git-conflict.nvim',
  {
    "mg979/vim-visual-multi",
    branch = "master",
    config = function()
      vim.g.VM_maps = { ['Find Under'] = '<C-n>' }
    end,
  },
})
