return {
  "ten3roberts/window-picker.nvim",
  config = function()
    require("window-picker").setup({
      -- Default keys to annotate, keys will be used in order. The default uses the
      -- most accessible keys from the home row and then top row.
      keys = "alskdjfhgwoeiruty",
      -- Swap windows by holding shift + letter
      swap_shift = true,
      -- Windows containing filetype to exclude
      exclude = { qf = true, NvimTree = true, aerial = true },
      -- Flash the cursor line of the newly focused window for 300ms.
      -- Set to 0 or false to disable.
      flash_duration = 0,
    })
  end,
}
