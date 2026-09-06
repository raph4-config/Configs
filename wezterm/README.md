# wezterm

WezTerm config (`.wezterm.lua`), synced to `~/.wezterm.lua` by `sync.sh`.

## Settings

| Option | Value |
|--------|-------|
| `font` / `font_size` | JetBrainsMono NF / 14.0 |
| `color_scheme` | Tokyo Night |
| `window_background_opacity` | 0.92, with macOS blur at 30 |
| `window_decorations` | `RESIZE`: no title bar |
| `hide_tab_bar_if_only_one_tab` | tab bar shows from the second tab on |
| `use_fancy_tab_bar` | `false`: the macOS bar looks like a title bar |

Anything read at startup (decorations, fullscreen mode) needs a full relaunch, not just a config
reload. `wezterm cli spawn` and `open -na` reuse the running process, so they will not show it.

## Panes (custom)

| Action | Key |
|--------|-----|
| Split left \| right | `⌘ + D` |
| Split top / bottom | `⌘ + ⇧ + D` |
| Close pane | `⌘ + W` |
| Move between panes | `⌘ + ⌥ + ← / → / ↑ / ↓` |

## Windows and tabs (defaults)

| Action | Key |
|--------|-----|
| Fullscreen | `Alt + Enter` |
| New tab / window | `⌘ + T` / `⌘ + N` |
| Prev / next tab | `⌘ + ⇧ + [` / `]` |
| Go to tab 1..9 | `⌘ + 1..9` |
| Switch window (macOS) | `⌘ + \`` |
| Move window without a title bar | `⌘ + drag` anywhere |
| Search scrollback | `⌘ + F` |
| Copy mode | `⌃ + ⇧ + X` |
| Command palette | `⌃ + ⇧ + P` |

Native macOS fullscreen was tried and dropped: a dedicated Space has a black backdrop, which
cancels the window transparency.
