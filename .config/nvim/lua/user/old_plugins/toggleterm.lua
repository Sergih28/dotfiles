return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- this is needed for barbecue.nvim to not show at first when opening the terminal
      on_open = function(term)
        vim.defer_fn(function()
          vim.wo[term.window].winbar = ""
        end, 0)
      end,
    })
  end,
  opts = {},
}
