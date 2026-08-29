# Corne (crkbd) — keymap `arn`

42-key split. AZERTY letters emitted as US keycodes, so macOS stays on **ABC/US**.
Three layers, modifiers on the home row.

## Modifiers — home row

```
        q   s   d   f              j   k   l   m
        ⌘   ⌥   ⌃   ⇧              ⇧   ⌃   ⌥   ⌘
```

Tap = the letter. Hold = the modifier. Mirrored, so every modifier exists on both hands.

**One rule: opposite hand fires instantly, same hand needs a beat.**

| Combo | How |
|-------|-----|
| `⌥ →` word nav | hold `s` (left) + RAISE `l` (right) |
| `⌥ ⌫` delete word | hold `s` (left) + BSPC (right thumb) |
| `⌃ a` line start | hold `k` (right) + `a` (left) |
| `⌘ ⌫` | left thumb ⌘ + BSPC — thumbs are plain mods, no rule applies |
| `⌥ f` | same hand: hold `s` ~0.2 s *before* `f` |

Typing "de", "sa" or "kl" at speed can never fire a modifier: under 200 ms on the same
hand, QMK always resolves to the letter (`CHORDAL_HOLD` in `config.h`).

⌘ is still on the left thumb and ⇧ on the outer columns, so ⌘C / ⌘V are unchanged.

## Layers

Left thumb = LOWER · right thumb = RAISE · both = ADJUST.

### BASE
```
┌───┬───┬───┬───┬───┬───┐   ┌───┬───┬───┬───┬───┬───┐
│TAB│ A │ Z │ E │ R │ T │   │ Y │ U │ I │ O │ P │DEL│
├───┼───┼───┼───┼───┼───┤   ├───┼───┼───┼───┼───┼───┤
│ESC│ Q │ S │ D │ F │ G │   │ H │ J │ K │ L │ M │ENT│
│   │ ⌘ │ ⌥ │ ⌃ │ ⇧ │   │   │   │ ⇧ │ ⌃ │ ⌥ │ ⌘ │   │
├───┼───┼───┼───┼───┼───┤   ├───┼───┼───┼───┼───┼───┤
│SFT│ W │ X │ C │ V │ B │   │ N │ , │ . │ ' │ _ │SFT│
└───┴───┴───┼───┼───┼───┤   ├───┼───┼───┼───┴───┴───┘
            │⌘  │LOW│SPC│   │BSP│RAI│⌥  │
            └───┴───┴───┘   └───┴───┴───┘
```
`'` `_` `.` `,` are direct, no layer needed.

### LOWER — symbols left, numpad right
```
┌───┬───┬───┬───┬───┬───┐   ┌───┬───┬───┬───┬───┬───┐
│ ~ │ ! │ @ │ # │ $ │ % │   │ ^ │ ( │ ) │ 1 │ 2 │ 3 │
├───┼───┼───┼───┼───┼───┤   ├───┼───┼───┼───┼───┼───┤
│CTL│ - │ + │ = │ * │ / │   │ [ │ ] │ " │ 4 │ 5 │ 6 │
├───┼───┼───┼───┼───┼───┤   ├───┼───┼───┼───┼───┼───┤
│SFT│ < │ > │ & │ | │ \ │   │ { │ } │ ; │ 7 │ 8 │ 9 │
└───┴───┴───┼───┼───┼───┤   ├───┼───┼───┼───┴───┴───┘
            │⌘  │///│SPC│   │ 0 │ADJ│ ? │
            └───┴───┴───┘   └───┴───┴───┘
```

### RAISE — navigation
```
┌───┬───┬───┬───┬───┬───┐   ┌───┬───┬───┬───┬───┬───┐
│DEL│F1 │F2 │F3 │F4 │F5 │   │F6 │F7 │F8 │F9 │F10│F11│
├───┼───┼───┼───┼───┼───┤   ├───┼───┼───┼───┼───┼───┤
│CTL│HOM│PUP│PDN│END│TAB│   │ ← │ ↓ │ ↑ │ → │ENT│F12│
├───┼───┼───┼───┼───┼───┤   ├───┼───┼───┼───┼───┼───┤
│SFT│UND│CUT│CPY│PST│   │   │ ! │ ? │ ; │ : │ " │SFT│
└───┴───┴───┼───┼───┼───┤   ├───┼───┼───┼───┴───┴───┘
            │⌘  │LOW│SPC│   │BSP│DEL│⌥  │
            └───┴───┴───┘   └───┴───┴───┘
```
Arrows follow vim: `H J K L`. Word nav = home row `⌥` + arrow.

### ADJUST — system and media
```
┌───┬───┬───┬───┬───┬───┐   ┌───┬───┬───┬───┬───┬───┐
│RST│   │   │   │   │   │   │   │   │   │   │   │   │
├───┼───┼───┼───┼───┼───┤   ├───┼───┼───┼───┼───┼───┤
│   │   │   │   │   │   │   │PRV│PLY│NXT│   │   │   │
├───┼───┼───┼───┼───┼───┤   ├───┼───┼───┼───┼───┼───┤
│   │   │   │CAP│   │   │   │   │MUT│V- │V+ │   │   │
└───┴───┴───┼───┼───┼───┤   ├───┼───┼───┼───┴───┴───┘
```
`RST` = bootloader. Caps Word: tap both shifts, one word in caps, off at space.

## Build and flash

Same firmware on both halves, one at a time. Bootloader is `caterina`.

```sh
./sync.sh                            # copy the keymap into ~/qmk_firmware
qmk compile -kb crkbd/rev1 -km arn   # verify it builds
qmk flash   -kb crkbd/rev1 -km arn   # then reset the half that is plugged in
```

At `Detecting caterina bootloader…`, plug in one half alone and hit reset (double-tap,
or the `RST` key on ADJUST). Repeat for the other half. `SPLIT_USB_DETECT` handles
master/slave, so there is no handedness to set.
