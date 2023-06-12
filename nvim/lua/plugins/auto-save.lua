-- import auto-save plugin safely
local setup, autosave = pcall(require, "auto-save")
if not setup then
  return
end

autosave.setup({
  trigger_events = {"FocusLost"},
  --, "ModeChanged"
  -- {"InsertLeave", "TextChanged"},
})
