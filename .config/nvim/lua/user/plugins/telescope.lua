return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "piersolenski/telescope-import.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-telescope/telescope-file-browser.nvim" },
  },
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        --  "┐", --[[ "╭", "╮", "╯", "╰" ]]
        borderchars = {
          "─",
          "│",
          "─",
          "│",
          "┌",
          "┐",
          "┘",
          "└",
        },
        file_ignore_patterns = { "node_modules" },
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
      pickers = {
        find_files = {
          hidden = true, -- show hidden files
        },
        buffers = {
          mappings = {
            n = {
              ["<C-d>"] = require("telescope.actions").delete_buffer,
            },
            i = {
              ["<C-h>"] = "which_key",
              ["<C-d>"] = require("telescope.actions").delete_buffer,
            },
          },
        },
      },
      extensions = {
        heading = { treesitter = true },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
          previewer = false,
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
    pcall(require("telescope").load_extension, "import")
    pcall(require("telescope").load_extension, "file_browser")

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>s/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[S]earch [/] in Open Files" })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })

    vim.keymap.set("n", "<leader>pws", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)

    vim.keymap.set("n", "<leader>pWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
  end,
}
