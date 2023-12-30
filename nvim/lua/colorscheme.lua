vim.g.sonokai_transparent_background = 1

local status, _ = pcall(vim.cmd, "colorscheme sonokai")

if not status then
  print("Colorscheme not found!")
  return
end

-- change colors
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
vim.cmd("highlight DiffText guibg=#0047AB guifg=#ffffff")


-- Highlight trailing whitespace
vim.cmd("highlight TrailingWhiteSpace ctermbg=red guibg=DarkRed")
vim.cmd("match TrailingWhiteSpace /\\s\\+$/")

