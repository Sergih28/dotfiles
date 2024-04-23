return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      outline = {
        layout = "float",
        max_height = 1,
        left_width = 0.45,
      },
      symbol_in_winbar = {
        enable = true,
        show_file = true,
        folder_level = 0,
      },
      -- doesn't seem to work, at least on typescript, but finder integration does
      implement = {
        enable = true,
        sign = true,
        virtual_text = true,
        priority = 100,
      },
      definition = {
        width = 0.7,
        height = 0.7,
      },
      finder = {
        methods = {
          tyd = "textDocument/typeDefinition",
        },
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
