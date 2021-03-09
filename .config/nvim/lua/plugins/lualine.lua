local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup({
  options = {
    theme = "auto",
  },
  sections = {
    lualine_c = {
      {
        'filename',
        file_status = true,
        newfile_status = false,
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = '[+]',
          readonly = '[-]',
          unnamed = '[No Name]',
          newfile = '[New]',
        }
      }
    },
    lualine_y = { 'filesize' }
  }
})
