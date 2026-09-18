return {
  "sphamba/smear-cursor.nvim",
  -- Disabled while chasing a statusline that keeps blanking out: the plugin
  -- positions its floating windows in absolute screen coordinates, with
  -- nothing keeping them off the statusline row. Flip back to true to test.
  enabled = true,
  opts = {
    cursor_color = "#7aa2f7", -- tokyonight-night blue

    -- Smooth: the cursor eases into its target instead of snapping to it.
    stiffness = 0.45,
    trailing_stiffness = 0.25,
    damping = 0.85,

    -- Framerate, not speed: a short interval is what makes the motion fluid.
    time_interval = 7, -- ms between draws, default 17

    -- Insert mode stays a bit tighter, so typing does not drag a tail around.
    stiffness_insert_mode = 0.5,
    trailing_stiffness_insert_mode = 0.4,
    damping_insert_mode = 0.9,

    -- The smear crosses the statusline row on its way to the command line.
    smear_to_cmd = false,
  },
}
