return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-live-grep-args.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-frecency.nvim",
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local lga_actions = require("telescope-live-grep-args.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-h>"] = actions.preview_scrolling_left,
            ["<C-l>"] = actions.preview_scrolling_right,
            ["<C-f>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-]>"] = actions.cycle_history_next,
            ["<C-[>"] = actions.cycle_history_prev,
            ["<C-c>"] = actions.close,
            ["<C-q>"] = actions.close,
          },
        },
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
        },
        file_ignore_patterns = {
          "node_modules", ".git"
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-n>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<C-w>"] = lga_actions.quote_prompt({ postfix = " -w " }),
              ["<C-s>"] = lga_actions.quote_prompt({ postfix = " -s " }),
            },
          },
        },
        frecency = {
          db_safe_mode = false,
          show_filter_column = false,
        },
        ["ui-select"] = {
          require('telescope.themes').get_dropdown({}),
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("ui-select")
    telescope.load_extension("frecency")
  end
}
