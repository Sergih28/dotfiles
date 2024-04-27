return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    -- "ibhagwan/fzf-lua", -- optional
  },
  opts = {
    kind = "auto",
    -- kind = "floating",
    integrations = {
      telescope = true,
      diffview = true,
    },
  },
  config = true,
}
