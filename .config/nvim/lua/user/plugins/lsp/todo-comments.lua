return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*]]
    },
    search = {
      pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    }
  }
}
