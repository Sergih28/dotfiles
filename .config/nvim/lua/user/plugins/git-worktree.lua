return {
  "ThePrimeagen/git-worktree.nvim",
  config = function()
    require("telescope").load_extension("git_worktree")
    require("git-worktree").setup()

    vim.keymap.set("n", "<leader>gwl", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
    vim.keymap.set("n", "<leader>gwa", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
  end,
}
