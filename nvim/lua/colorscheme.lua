vim.g.sonokai_transparent_background = 1

local status, _ = pcall(vim.cmd, "colorscheme sonokai")

if not status then
  print("Colorscheme not found!")
  return
end

vim.cmd("highlight ColorColumn guibg=DarkBlue")
vim.cmd("highlight Visual guibg=#555555")

-- Highlight trailing whitespace
vim.cmd("highlight TrailingWhiteSpace ctermbg=red guibg=DarkRed")
vim.cmd("match TrailingWhiteSpace /\\s\\+$/")

