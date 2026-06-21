// Copyright 2025 @arn
// SPDX-License-Identifier: GPL-2.0-or-later

#pragma once

// ============================================================================
// ERGONOMICS SETTINGS
// ============================================================================

#define TAPPING_TERM 180
#define PERMISSIVE_HOLD
#define TAPPING_FORCE_HOLD

// Caps Word: tap both shifts to UPPERCASE one word, auto-off at space
#define BOTH_SHIFTS_TURNS_ON_CAPS_WORD

// ============================================================================
// OLED DISPLAY (if present)
// ============================================================================

#ifdef OLED_ENABLE
    #define OLED_TIMEOUT 30000
    #define OLED_BRIGHTNESS 128
#endif

// ============================================================================
// MOUSE KEYS
// ============================================================================

#ifdef MOUSEKEY_ENABLE
    #define MOUSEKEY_DELAY 0
    #define MOUSEKEY_INTERVAL 16
    #define MOUSEKEY_MOVE_DELTA 8
    #define MOUSEKEY_MAX_SPEED 10
    #define MOUSEKEY_TIME_TO_MAX 30
    #define MOUSEKEY_WHEEL_DELAY 0
    #define MOUSEKEY_WHEEL_INTERVAL 50
    #define MOUSEKEY_WHEEL_MAX_SPEED 8
    #define MOUSEKEY_WHEEL_TIME_TO_MAX 40
#endif

// ============================================================================
// PERFORMANCE
// ============================================================================

#define NO_ACTION_MACRO
#define NO_ACTION_FUNCTION

// ============================================================================
// SPLIT KEYBOARD
// ============================================================================

#define USE_SERIAL
#define SOFT_SERIAL_PIN D2
#define SPLIT_USB_DETECT
#define SPLIT_USB_TIMEOUT 2000
