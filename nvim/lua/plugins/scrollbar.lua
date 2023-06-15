-- import comment plugin safely
local setup, scrollbar = pcall(require, "scrollbar")
if not setup then
  return
end

-- enable comment
scrollbar.setup()
