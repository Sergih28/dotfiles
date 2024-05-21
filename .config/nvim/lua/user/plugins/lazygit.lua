vim.g.lazygit_floating_window_border_chars = { "┌", "─", "┐", "│", "┘", "─", "└", "│" } -- customize lazygit popup window border characters

-- Add this to lazygit config (:LazyGitConfig)
-- gui:
--   border: single

return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 1 -- scaling factor for floating window
  end,
}
