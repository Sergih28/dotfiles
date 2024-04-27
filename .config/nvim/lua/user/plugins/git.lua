return {
  "dinhhuy258/git.nvim",
  config = function()
    require("git").setup({
      default_mappings = false,
      keymaps = {
        blame = "<leader>gbl",
        -- Open file/folder in git repository
        browse = "<leader>go",
        diff = "<Leader>gd",
        diff_close = "<Leader>gD",
        open_pull_request = "<Leader>gpr",
        create_pull_request = "<Leader>gPr",
        -- Revert to the specific commit
        revert = "<Leader>gr",
        -- Revert the current file to the specific commit
        revert_file = "<Leader>gR",
      },
    })
  end,
}
