## ⌨️ Keyboard Layouts

### BASE - AZERTY Native
```
Left Hand                              Right Hand
┌───┬───┬───┬───┬───┬───┐            ┌───┬───┬───┬───┬───┬───┐
│TAB│ A │ Z │ E │ R │ T │            │ Y │ U │ I │ O │ P │DEL│
├───┼───┼───┼───┼───┼───┤            ├───┼───┼───┼───┼───┼───┤
│ESC│ Q │ S │ D │ F │ G │            │ H │ J │ K │ L │ M │ENT│
├───┼───┼───┼───┼───┼───┤            ├───┼───┼───┼───┼───┼───┤
│SFT│ W │ X │ C │ V │ B │            │ N │ , │ . │ ' │ _ │SFT│
└───┴───┴───┼───┼───┼───┤            ├───┼───┼───┼───┴───┴───┘
            │GUI│LOW│SPC│            │BSP│RAI│ALT│
            └───┴───┴───┘            └───┴───┴───┘
```
**Mac mods**: `GUI` = ⌘ Cmd (left thumb) · `ALT` = ⌥ Option (right thumb)
**Python direct**: `'` `_` `.` `,` → No LOWER needed! (`:` via LOWER/RAISE)

---         

### LOWER - Symbols + Numpad
```
Left Hand (Operators)                 Right Hand (Brackets + Numbers)
┌───┬───┬───┬───┬───┬───┐            ┌───┬───┬───┬───┬───┬───┐
│ ~ │ ! │ @ │ # │ $ │ % │            │ ^ │ ( │ ) │ 1 │ 2 │ 3 │
├───┼───┼───┼───┼───┼───┤            ├───┼───┼───┼───┼───┼───┤
│CTL│ - │ + │ = │ * │ / │            │ [ │ ] │ " │ 4 │ 5 │ 6 │
├───┼───┼───┼───┼───┼───┤            ├───┼───┼───┼───┼───┼───┤
│SFT│ < │ > │ & │ | │ \ │            │ { │ } │ ; │ 7 │ 8 │ 9 │
└───┴───┴───┼───┼───┼───┤            ├───┼───┼───┼───┴───┴───┘
            │GUI│///│SPC│            │ 0 │ADJ│ ? │
            └───┴───┴───┘            └───┴───┴───┘
```
**Logic**: All operators left, all brackets right, numpad 789/456/123/0

---

### RAISE - Navigation + F-keys
```
Left Hand (Page Nav + F-keys)         Right Hand (Arrows HJKL + F-keys)
┌───┬───┬───┬───┬───┬───┐            ┌───┬───┬───┬───┬───┬───┐
│DEL│F1 │F2 │F3 │F4 │F5 │            │F6 │F7 │F8 │F9 │F10│F11│
├───┼───┼───┼───┼───┼───┤            ├───┼───┼───┼───┼───┼───┤
│CTL│HOM│PUP│PDN│END│TAB│            │ ← │ ↓ │ ↑ │ → │ENT│F12│
├───┼───┼───┼───┼───┼───┤            ├───┼───┼───┼───┼───┼───┤
│SFT│UND│CUT│CPY│PST│   │            │ ! │ ? │ ; │ : │ " │SFT│
└───┴───┴───┼───┼───┼───┤            ├───┼───┼───┼───┴───┴───┘
            │GUI│ADJ│SPC│            │BSP│DEL│ALT│
            └───┴───┴───┘            └───┴───┴───┘
```
**Vim arrows**: H=← J=↓ K=↑ L=→ | **Edit**: Undo/Cut/Copy/Paste = Z/X/C/V

---

### ADJUST - System Settings
```
Left Hand (RGB OFF)                   Right Hand (Media Keys)
┌───┬───┬───┬───┬───┬───┐            ┌───┬───┬───┬───┬───┬───┐
│RST│   │   │   │   │   │            │   │   │   │   │   │   │
├───┼───┼───┼───┼───┼───┤            ├───┼───┼───┼───┼───┼───┤
│   │   │   │   │   │   │            │PRV│PLY│NXT│   │   │   │
├───┼───┼───┼───┼───┼───┤            ├───┼───┼───┼───┼───┼───┤
│   │   │   │   │   │   │            │   │MUT│V- │V+ │   │   │
└───┴───┴───┼───┼───┼───┤            ├───┼───┼───┼───┴───┴───┘
            │   │///│   │            │   │///│   │
            └───┴───┴───┘            └───┴───┴───┘
```
**Access**: Hold LOWER + RAISE | **Reset**: Top-left for bootloader mode

---

## 🔧 Flashing the keyboard (both halves)

**Split** keyboard (Corne / crkbd), Pro Micro, `caterina` bootloader. The **same firmware** is flashed onto each half, one half at a time.

### 1. Copy the keymap into the QMK tree (if not done yet)
```sh
# From this repo, into your qmk_firmware clone
cp keymap.c config.h rules.mk ~/qmk_firmware/keyboards/crkbd/keymaps/arn/
```

### 2. Compile (make sure it builds before flashing)
```sh
qmk compile -kb crkbd -km arn
```

### 3. Flash the LEFT half
```sh
qmk flash -kb crkbd -km arn
```
When `qmk` prints **"Detecting caterina bootloader…"**:
1. Plug in **only** the left half over USB.
2. Put it in bootloader mode: press **reset** (or double-tap), or use the `RESET`/`QK_BOOT` key on the **ADJUST** layer (top-left).
3. Flashing starts automatically once the caterina port is detected.

### 4. Flash the RIGHT half
Run the exact same command, then plug in and reset the right half:
```sh
qmk flash -kb crkbd -km arn
```
1. Unplug the left, plug in **only** the right half.
2. Reset / bootloader (same `QK_BOOT` key on the ADJUST layer).
3. Flashing starts again on its own.

### Notes
- Firmware is **identical** on both sides: `SPLIT_USB_DETECT` handles master/slave detection automatically.
- No handedness to set here: this keymap relies on `SPLIT_USB_DETECT` (see `config.h`), so the same `.hex` goes on both halves.
- If the bootloader isn't detected: quickly double-tap the reset button, or bridge `RST`–`GND` twice.
