local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font('JetBrainsMono NF')
config.font_size = 14.0

-- ─── APPEARANCE ─────────────────────────────────────────────
config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 0.92
config.macos_window_background_blur = 30
config.window_decorations = 'RESIZE'
config.window_padding = { left = 8, right = 8, top = 8, bottom = 0 }
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false        -- the macOS fancy bar looks like a title bar

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
  -- same moves, vim style
  { key = 'h', mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Down' },
}

-- Fullscreen at launch: no config option does this, the gui-startup hook is required
local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

return config
