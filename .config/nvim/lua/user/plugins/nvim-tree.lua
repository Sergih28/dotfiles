return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for arrows in tree to light blue
    --vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

    --configure nvim-tree
    nvimtree.setup({
      sort_by = "case_sensitive",
      update_focused_file = {
        enable = true,
      },
      view = {
        width = 35,
	      relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        group_empty = true,
	      indent_markers = {
          enable = true
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
      diagnostics = {
        enable = true,
      }
    })
  end
}
