# Chrome — mouse-free

Two systems side by side:

- **Chrome shortcuts** use `⌘`. They work everywhere, including `chrome://` pages.
- **[Vimium](https://chromewebstore.google.com/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)**
  uses bare letters. It only works on real web pages: not on `chrome://`, not the Web
  Store, not the PDF viewer. Fall back to `⌘` there.

Two things to switch on once: System Settings > Keyboard > **Keyboard navigation**, so Tab
reaches buttons and not just text fields; and in the Vimium options, **Smooth scrolling**
plus **Filter link hints by character**, so `f` matches the link text instead of random
letters.

## Open Chrome, switch window

| Action | Key |
|--------|-----|
| Launch / focus Chrome | `⌘ Space` then `chrome` |
| Switch app | `⌘ Tab` |
| **Cycle Chrome windows (normal ↔ incognito)** | `` ⌘ ` `` |
| New incognito window | `⌘ ⇧ N` |
| New normal window | `⌘ N` |

`⌘ ⇧ N` opens incognito, `` ⌘ ` `` is how you hop back and forth afterwards.

## Tabs

| Action | Chrome | Vimium |
|--------|--------|--------|
| New / close / reopen | `⌘ T` / `⌘ W` / `⌘ ⇧ T` | `t` / `x` / `X` |
| Next / previous | `⌘ ⌥ →` / `⌘ ⌥ ←` | `K` / `J` |
| Nth tab / last tab | `⌘ 1..8` / `⌘ 9` | |
| **Search open tabs by title** | | `T` |
| Last used tab | | `^` |

`T` is the one that scales: type a few letters of the title instead of cycling.

Continuous scrolling is key repeat: hold `j`. If it feels sluggish, raise it in
System Settings > Keyboard (Key repeat rate up, Delay until repeat down), and turn on
**Smooth scrolling** in the Vimium options.

## Bookmarks

| Action | Key |
|--------|-----|
| **Fuzzy search all bookmarks, then open** | `b` (`B` = new tab) |
| Bookmark manager | `⌘ ⌥ B` |
| Bookmark this page | `⌘ D` |
| Show / hide bookmarks bar | `⌘ ⇧ B` |

`b` searches the whole bookmark tree by name, folders included. It beats browsing the
manager. In the manager itself, arrows and Tab navigate.

## Inside a page: search, read, click

| Action | Key |
|--------|-----|
| **Show hint letters on every link, type one to click** | `f` (`F` = new tab) |
| Find on page / next / previous | `/` then `n` / `N` |
| Scroll down / up (hold to keep scrolling) | `j` / `k` |
| Scroll one screen down / up | `Space` / `⇧ Space` |
| Half page down / up | `d` / `u` |
| Top / bottom | `gg` / `G` |
| Focus first text field | `gi` |
| Back / forward | `H` / `L` |
| Open URL, history or bookmark | `o` (`O` = new tab) |
| Copy current URL | `yy` |
| Reload | `r` |
| Vimium help | `?` |

Chrome equivalents when Vimium is inactive: `⌘ L` address bar, `⌘ F` find, `⌘ G` / `⌘ ⇧ G`
next and previous match, `⌘ [` / `⌘ ]` back and forward, `⌘ R` reload.

### Full search flow, no mouse

```
⌘ L        focus the address bar
<query>    type, Enter
f          hint letters appear over every result
<letters>  the result opens
H          back to the results
```
