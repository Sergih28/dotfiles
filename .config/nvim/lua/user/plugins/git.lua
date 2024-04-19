return {
  "dinhhuy258/git.nvim",
  config = function()
    require("git").setup({
      keymaps = {
        -- Open blame window
        blame = "<leader>gbl",
        -- Open file/folder in git repository
        browse = "<leader>go",
        -- Opens a new diff that compares against the current index
        diff = "<Leader>gd",
        -- Close git diff
        diff_close = "<Leader>gD",
      },
    })
  end,
}
