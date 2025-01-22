vim.g.sonokai_transparent_background = 1

local status, _ = pcall(vim.cmd, "colorscheme sonokai")

if not status then
  print("Colorscheme not found!")
  return
end

vim.cmd("highlight ColorColumn guibg=DarkBlue")
vim.cmd("highlight Visual guibg=#555555")
vim.cmd("highlight DiffText guibg=DarkBlue")
vim.cmd("highlight TSPunctBracket guifg=#aaaaaa")
vim.cmd("highlight TSPunctDelimiter guifg=#aaaaaa")
vim.cmd("highlight TSLabel guifg=#FF9872")
vim.cmd("highlight TSSymbol guifg=#A4C6FF")
vim.cmd("highlight TSFunction guifg=#CC99FF")
vim.cmd("highlight TSFunctionCall guifg=#CC99FF")
vim.cmd("highlight NvimTreeFolderName guifg=#ffffff")
vim.cmd("highlight TrailingWhiteSpace ctermbg=red guibg=DarkRed")
vim.cmd("highlight FloatBorder guibg=none")
vim.cmd("highlight NormalFloat guibg=none")
vim.cmd("highlight FloatTitle guibg=none guifg=#fc5d7c")
vim.cmd("match TrailingWhiteSpace /\\s\\+$/")

vim.opt.guicursor = {
  "n-v-c:block-Cursor/lCursor",
  "i-ci-ve:ver25-CursorInsert",
  "r-cr:hor20-CursorReplace",
  "o:hor50-CursorOther"
}

vim.api.nvim_set_hl(0, "Cursor", { fg = "NONE", bg = "green" })
vim.api.nvim_set_hl(0, "CursorInsert", { fg = "NONE", bg = "green" })
