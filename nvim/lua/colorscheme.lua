local status, _ = pcall(vim.cmd, "colorscheme nightfly")

if not status then
  print("Coorscheme not found!")
  return
end
