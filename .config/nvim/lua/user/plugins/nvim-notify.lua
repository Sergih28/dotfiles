return {
  'rcarriga/nvim-notify',
  config = function()
    require("notify").setup({
      minimum_width = 10,
      background_colour = "#000000", -- without this complains about the background color

      -- Sharp window corners
      on_open = function(win)
        local config = vim.api.nvim_win_get_config(win)
        config.border = "single"
        vim.api.nvim_win_set_config(win, config)
      end
    })
  end
}
