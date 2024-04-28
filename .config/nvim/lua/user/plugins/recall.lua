return {
  "fnune/recall.nvim",
  version = "*",
  config = function()
    local recall = require("recall")

    recall.setup({})

    vim.keymap.set("n", "<leader>bt", recall.toggle, { noremap = true, silent = true, desc = "[B]ookmark [T]oggle" })
    vim.keymap.set("n", "]b", recall.goto_next, { noremap = true, silent = true, desc = "Next [B]ookmark" })
    vim.keymap.set("n", "[b", recall.goto_prev, { noremap = true, silent = true, desc = "Previous [B]ookmark" })
    vim.keymap.set("n", "<leader>bd", recall.clear, { noremap = true, silent = true, desc = "[B]ookmarks [D]elete" })
    vim.keymap.set("n", "<leader>bl", ":Telescope recall<CR>", { noremap = true, silent = true, desc = "Show [B]ookmarks [L]ist" })
  end,
}
