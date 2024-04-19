return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*]]
    },
    search = {
      pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    }
  }
}
