# Copyright 2025 @arn
# SPDX-License-Identifier: GPL-2.0-or-later

BOOTLOADER = caterina

# ============================================================================
# FIRMWARE FEATURES
# ============================================================================

BOOTMAGIC_ENABLE = yes
MOUSEKEY_ENABLE = yes
EXTRAKEY_ENABLE = yes
NKRO_ENABLE = yes

CONSOLE_ENABLE = no
COMMAND_ENABLE = no
AUDIO_ENABLE = no

# ============================================================================
# RGB - COMPLETELY DISABLED
# ============================================================================

RGBLIGHT_ENABLE = no
RGB_MATRIX_ENABLE = no

# ============================================================================
# OTHER FEATURES
# ============================================================================

OLED_ENABLE = no
ENCODER_ENABLE = no
CAPS_WORD_ENABLE = no
COMBO_ENABLE = no
TAP_DANCE_ENABLE = no
LEADER_ENABLE = no
UNICODE_ENABLE = no
SPACE_CADET_ENABLE = no

# ============================================================================
# OPTIMIZATION
# ============================================================================

LTO_ENABLE = yes
AVR_USE_MINIMAL_PRINTF = yes
SPLIT_KEYBOARD = yes
