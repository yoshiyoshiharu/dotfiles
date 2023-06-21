local status, _ = pcall(vim.cmd, "colorscheme molokai")

if not status then
  print("Coorscheme not found!")
  return
end

vim.cmd("highlight ColorColumn guibg=LightBlue")

-- Highlight trailing whitespace
vim.cmd("highlight TrailingWhiteSpace ctermbg=red guibg=DarkRed")
vim.cmd("match TrailingWhiteSpace /\\s\\+$/")
