local status, _ = pcall(vim.cmd, "colorscheme molokai")

if not status then
  print("Coorscheme not found!")
  return
end

