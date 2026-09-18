return {
  "sphamba/smear-cursor.nvim",
  opts = {
    cursor_color = "#7aa2f7", -- tokyonight-night purple

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

    -- Thinner and shorter than the defaults.
    volume_reduction_exponent = 0.6, -- default 0.3, how fast the trail thins out
    minimum_volume_factor = 0.4, -- default 0.7, floor that thinning stops at
    max_length = 12, -- default 25, in cells

    -- The smear crosses the statusline row on its way to the command line.
    smear_to_cmd = false,
  },
}
