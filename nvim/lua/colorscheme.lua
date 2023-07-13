local status, _ = pcall(vim.cmd, "colorscheme sonokai")

if not status then
  print("Coorscheme not found!")
  return
end

vim.cmd("highlight ColorColumn guibg=DarkBlue")
vim.cmd("highlight Visual guibg=#888888")

-- Highlight trailing whitespace
vim.cmd("highlight TrailingWhiteSpace ctermbg=red guibg=DarkRed")
vim.cmd("match TrailingWhiteSpace /\\s\\+$/")

