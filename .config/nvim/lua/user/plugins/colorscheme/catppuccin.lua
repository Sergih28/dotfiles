return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        highlight_overrides = {
          mocha = function(mocha)
            return {
              LineNr = { fg = mocha.subtext0 }, -- Make line numbers color more visible
            }
          end,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
