return {
  "natecraddock/workspaces.nvim",
  config = function()
    require("workspaces").setup({
      hooks = {
        open_pre = {
          -- delete all buffers (does not save changes)
          "silent %bdelete!",
        },
        open = {
          "SessionRestore",
        },
      },
    })
  end,
}
