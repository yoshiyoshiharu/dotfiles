local status, _ = pcall(vim.cmd, "colorscheme tender")

if not status then
  print("Coorscheme not found!")
  return
end
