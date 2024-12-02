return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    columns = {
      "icon",
      "size",
    },
    delete_to_trash = true,
    watch_for_changes = true,
    view_options = {
      show_hidden = true,
      natural_order = true, -- default is "fast" which disables it for large directories
      is_always_hidden = function(name, _) -- remove .. and .git folders
        return name == ".." or name == ".git"
      end,
    },
    keymaps = {
      -- Close with q instead of <C-c>
      ["<C-c>"] = false,
      ["q"] = "actions.close",

      -- Remap this because it clashes with my save file keybind (<C-s>)
      ["<C-s>"] = false,
      ["<C-g>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
    },
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
