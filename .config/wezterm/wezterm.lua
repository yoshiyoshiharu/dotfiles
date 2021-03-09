local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font_with_fallback {
  'Hack',
  'Monaspace Neon',
  'monospace'
}
config.font_size = 11.5
config.line_height = 1.0
config.color_scheme = 'Dracula+'
config.window_background_opacity = 0.95

config.leader = { key = 'g', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = 't',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'DefaultDomain',
  },
  {
    key = '/',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  }
}

return config
