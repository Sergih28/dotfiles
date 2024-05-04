return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        -- auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      })
    end,
  },
  {
    "rmagatti/session-lens",
    config = function()
      require("session-lens").setup({
        theme_conf = {
          border = true,
        },
      })
    end,
  },
}
