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
  -- 'RRethy/nvim-treesitter-endwise' https://github.com/RRethy/nvim-treesitter-endwise/issues/41が修正されれば有効化する,
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
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
})
