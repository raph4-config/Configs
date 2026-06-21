local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font('JetBrainsMono NF')
config.font_size = 14.0

-- ─── PANES: split + navigation ──────────────────────────────
config.keys = {
  -- Split the current pane
  { key = 'd', mods = 'CMD',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } }, -- left | right
  { key = 'd', mods = 'CMD|SHIFT', action = act.SplitVertical   { domain = 'CurrentPaneDomain' } }, -- top / bottom
  -- Close the current pane
  { key = 'w', mods = 'CMD',       action = act.CloseCurrentPane { confirm = true } },
  -- Move focus between panes
  { key = 'LeftArrow',  mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Down' },
}

return config
