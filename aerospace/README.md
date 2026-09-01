# AeroSpace — config `arn`

Tiling window manager. Everything lives in one macOS space, so no Mission Control animation
between workspaces. Modifier: `⌥`.

**One rule: `⌥ + hjkl` moves inside a screen, add `⌃` and you move between screens.**

| Term | What it is |
|------|------------|
| Workspace | A set of windows, `1..9`. Sits on one screen, can be sent to the other. |
| Monitor | A physical screen. Here: `1` the Samsung, `2` the built-in Retina. |
| Node | A window, or a group of windows, in the layout tree. |

## Keys

### Windows
| Action | Key |
|--------|-----|
| Focus | `⌥ + H / J / K / L` |
| Move in the layout | `⌥ + ⇧ + H / J / K / L` |
| Resize | `⌥ + -` / `⌥ + =` |
| Even out the sizes | `⌥ + ⇧ + =` |
| Fullscreen | `⌥ + F` |
| Floating <-> tiled | `⌥ + ⇧ + Space` |
| Tiles horizontal/vertical | `⌥ + /` |
| Accordion horizontal/vertical | `⌥ + ,` |
| Open / focus WezTerm | `⌥ + Enter` |

### Screens
| Action | Key |
|--------|-----|
| Focus a screen | `⌥ + ⌃ + H / J / K / L` |
| Next screen | `⌥ + ⌃ + Tab` |
| Send the window there, follow it | `⌥ + ⌃ + ⇧ + H / J / K / L` |
| Send the whole workspace to the other screen | `⌥ + ⇧ + Tab` |

### Workspaces
| Action | Key |
|--------|-----|
| Go to `1..9` | `⌥ + 1..9` |
| Send the window to `1..9` | `⌥ + ⇧ + 1..9` |
| Back to the previous one | `⌥ + Tab` |

### Modes
Two sticky modes, they exit back to main after one key.

| Mode | Enter | Then |
|------|-------|------|
| Join | `⌥ + ⇧ + Enter` | `h/j/k/l` groups the current window with that neighbour |
| Service | `⌥ + ⇧ + ;` | `esc` reload config · `r` flatten the tree · `f` toggle floating · `⌫` close every other window |

`r` is the one to remember: when the layout gets nested into something unreadable, it flattens
the whole workspace back to a plain split.

## On the Corne

`⌥` is the right thumb, and on the home row `s` (left) / `l` (right). `⌃` is `d` / `k`.

| Combo | How |
|-------|-----|
| `⌥ + h` | hold `s` (left), tap `h` (right) — opposite hands, fires instantly |
| `⌥ + ⌃ + l` | hold `s` + `d` (left), tap `l` (right) |
| `⌥ + ⌃ + ⇧ + h` | hold `s` + `d` + `f` (left), tap `h` (right) |
| `⌥ + 1..9` | **hold the right thumb `⌥` first**, then LOWER, then the digit |
| `⌥ + -`, `⌥ + =`, `⌥ + /` | same: `⌥` first, then LOWER, then the symbol |

Order matters for anything on LOWER: that layer remaps the right thumb to `?`, so `⌥` has to be
down before LOWER. A held key keeps the keycode it had when it was pressed.

See [`../keyboard/README.md`](../keyboard/README.md) for the home-row rules.

## CLI

Every binding is also a command, which makes it scriptable and easy to test.

```sh
aerospace list-monitors                          # screen ids and names
aerospace list-workspaces --monitor focused      # what is on this screen
aerospace list-windows --workspace focused       # what is in this workspace
aerospace list-apps                              # app-id, to write a floating rule

aerospace summon-workspace 3                     # pull workspace 3 onto the current screen
aerospace move-node-to-monitor --focus-follows-window next
aerospace trigger-binding --mode main alt-ctrl-tab   # fire a binding without the keyboard

aerospace enable off                             # pause tiling (screen share, stubborn app)
aerospace enable on
aerospace reload-config                          # after editing the toml by hand
```

## Install

```sh
brew install --cask --appdir="$HOME/Applications" nikitabobko/tap/aerospace
```

`--appdir` is required, this account is not admin. Then grant Accessibility
(System Settings > Privacy & Security > Accessibility) and run `./sync.sh`, which copies
`aerospace.toml` to `~/.config/aerospace/` and reloads a running instance.

`Can't connect to AeroSpace server` means the app is not running, or the permission is missing.
The app starts at login (`start-at-login = true`).

## Editing the config

Windows that should never tile go at the bottom of `aerospace.toml`:

```toml
[[on-window-detected]]
if.app-id = 'com.apple.calculator'
run = 'layout floating'
```

`aerospace list-apps` gives the `app-id`. After any edit: `./sync.sh` (or `⌥ + ⇧ + ;` then `esc`).
