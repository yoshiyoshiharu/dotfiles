-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

-- import telescope-ui-select safely
local themes_setup, themes = pcall(require, "telescope.themes")
if not themes_setup then
  return
end

local lga_actions = require("telescope-live-grep-args.actions")

-- configure telescope
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-h>"] = actions.preview_scrolling_left,
        ["<C-l>"] = actions.preview_scrolling_right,
        ["<C-f>"] = false,
        ["<C-f>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
        ["<C-]>"] = actions.cycle_history_next,
        ["<C-[>"] = actions.cycle_history_prev,
        ["<C-c>"] = actions.close,
        ["<C-q>"] = actions.close,
      },
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-n>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          ["<C-w>"] = lga_actions.quote_prompt({ postfix = " -w " }),
          ["<C-s>"] = lga_actions.quote_prompt({ postfix = " -s " }),
        },
      },
    },
    ["ui-select"] = {
      themes.get_dropdown({}),
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")
telescope.load_extension("ui-select")
