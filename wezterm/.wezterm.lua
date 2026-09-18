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
config.window_decorations = 'TITLE|RESIZE'
-- bottom must not be 0: the window height is rarely an exact multiple of the cell
-- height, and with nothing to absorb the remainder the last row gets clipped
config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false        -- the macOS fancy bar looks like a title bar

-- ─── KEYBOARD ───────────────────────────────────────────────
-- Option must reach the shell as Meta, not as a compose key: that is what
-- fzf's Alt+C and zsh's Alt+B / Alt+F / Alt+. expect. Safe on this machine,
-- the macOS layout is ABC and the brackets come from the QMK LOWER layer.
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- ─── PANES: split + navigation ──────────────────────────────
config.keys = {
  -- Split the current pane
  { key = 'd', mods = 'CMD',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } }, -- left | right
  { key = 'd', mods = 'CMD|SHIFT', action = act.SplitVertical   { domain = 'CurrentPaneDomain' } }, -- top / bottom
  -- Close the current pane
  { key = 'w', mods = 'CMD',       action = act.CloseCurrentPane { confirm = true } },
  -- Move focus between panes. CMD alone, not CMD|ALT: two fingers instead of
  -- three, and it keeps one rule for the whole machine, CMD outside nvim and
  -- CTRL inside it (nvim splits stay on CTRL+hjkl).
  -- Cost: CMD+h no longer hides WezTerm (CMD+m minimizes) and CMD+k no longer
  -- clears the scrollback (the `cl` alias does).
  { key = 'h', mods = 'CMD', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'CMD', action = act.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'CMD', action = act.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'CMD', action = act.ActivatePaneDirection 'Down' },
  -- same moves, for when the hand is already on the arrows
  { key = 'LeftArrow',  mods = 'CMD', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'CMD', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'CMD', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'CMD', action = act.ActivatePaneDirection 'Down' },
}

-- Fullscreen at launch: no config option does this, the gui-startup hook is required
local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

return config
