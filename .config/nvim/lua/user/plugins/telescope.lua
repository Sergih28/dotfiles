local borderchars = {
  "─",
  "│",
  "─",
  "│",
  "┌",
  "┐",
  "┘",
  "└",
}

return {
  "nvim-telescope/telescope.nvim", tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim", -- Sets vum.ui.select to telescope (e.g. code actions)
    "nvim-telescope/telescope-symbols.nvim", -- Emoji picker
    "nvim-telescope/telescope-file-browser.nvim", -- File browser
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Better fzf than native Telescope has
    "piersolenski/telescope-import.nvim", -- Import modules faster
  },
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        borderchars = borderchars,
        file_ignore_patterns = { "node_modules", ".git", "^%." },
        dynamic_preview_title = true,
        layout_strategy = "flex",
        sorting_strategy = "ascending",
        layout_config = {
          vertical = { width = 0.95, height = 0.8, prompt_position = "bottom" },
          horizontal = { width = 0.95, height = 0.95, prompt_position = "bottom" },
        },
        mappings = {
          n = {
            ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
          i = {
            ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-k>"] = actions.cycle_history_next,
            ["<C-j>"] = actions.cycle_history_prev,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({
            borderchars = borderchars,
            layout_strategy = "vertical",
          })
        },
        file_browser = {
          hijack_netrw = true,
        }
      },
      pickers = {
        find_files = {
          hidden = true, -- show hidden files
        },
        buffers = {
          mappings = {
            n = {
              ["<C-d>"] = actions.delete_buffer,
            },
            i = {
              ["<C-h>"] = "which_key",
              ["<C-d>"] = actions.delete_buffer,
            },
          },
        },
      },
    })

    -- Enable extensions
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("import")
  end,
}

