return {
  "dinhhuy258/git.nvim",
  config = function()
    require("git").setup({
      default_mappings = false,
      keymaps = {
        blame = "<leader>gbl",
        browse = "<leader>go",
        quit_blame_commit = "q",
        diff = "<Leader>gd",
        diff_close = "<Leader>gD",
        open_pull_request = "<Leader>gpr",
        create_pull_request = "<Leader>gPr",
        -- I think this is too dangerous, and I don't use it anyway
        -- revert = "<Leader>gr",-- Revert to the specific commit
        -- revert_file = "<Leader>gR",-- Revert the current file to the specific commit
      },
    })
  end,
}
