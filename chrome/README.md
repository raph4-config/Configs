# Chrome

Keyboard-only browsing. Shortcuts live in [`../shortcuts/chrome.md`](../shortcuts/chrome.md).

## Extension

| Extension | ID | Why |
|-----------|----|-----|
| [Vimium](https://chromewebstore.google.com/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb) | `dbepggeogbaibhgnhhndojpepiihcmeb` | link hints (`f`), bookmark search (`b`), tab search (`T`) |

## Settings

Vimium keeps its settings inside the browser profile, so `sync.sh` cannot push them.
Back them up here by hand instead:

1. Vimium Options (right-click the icon > Options, or `chrome://extensions`)
2. **Backup and Restore** > Backup, save as `chrome/vimium-settings.json`
3. On a new machine: install Vimium, then Restore from that file

Two options worth turning on in that same page:

- **Smooth scrolling** — makes `j` / `k` glide instead of jumping
- **Filter link hints by character** — type part of the link text instead of the hint letters
