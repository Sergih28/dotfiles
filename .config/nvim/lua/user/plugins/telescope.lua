return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules" },
      },
      pickers = {
        find_files = {
          hidden = true, -- show hidden files
        },
        buffers = {
          mappings = {
            n = {
              ["<c-d>"] = require("telescope.actions").delete_buffer,
            }, -- n
            i = {
              ["<c-h>"] = "which_key",
              ["<c-d>"] = require("telescope.actions").delete_buffer,
            },
          },
        },
      },
    })
  end,
}
