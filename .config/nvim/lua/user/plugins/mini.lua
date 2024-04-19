return {
  {
    "echasnovski/mini.trailspace",
    version = false,
    config = function()
      require("mini.trailspace").setup()
    end,
  },
  {
    "echasnovski/mini.cursorword",
    version = false,
    config = function()
      require("mini.cursorword").setup()
    end,
  },
  {
    "echasnovski/mini.pairs",
    version = false,
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.fuzzy",
    version = false,
    config = function()
      require("mini.fuzzy").setup()
    end,
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },
  -- {
  --   "echasnovski/mini.map",
  --   version = false,
  --   dependencies = {
  --     "lewis6991/gitsigns.nvim",
  --   },
  --   config = function()
  --     local map = require("mini.map")
  --     local diagnostic_integration = map.gen_integration.diagnostic({
  --       error = "DiagnosticFloatingError",
  --       warn = "DiagnosticFloatingWarn",
  --       info = "DiagnosticFloatingInfo",
  --       hint = "DiagnosticFloatingHint",
  --     })
  --     require("mini.map").setup({
  --       integrations = {
  --         map.gen_integration.builtin_search(),
  --         map.gen_integration.gitsigns(),
  --         diagnostic_integration,
  --       },
  --       window = {
  --         show_integration_count = false,
  --         winblend = 0, --75
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "echasnovski/mini.surround",
  --   version = false,
  --   config = function()
  --     require("mini.surround").setup()
  --   end,
  -- },
  -- {
  --   'echasnovski/mini.sessions',
  --   version = false,
  --   config = function ()
  --     require('mini.sessions').setup()
  --   end
  -- },
}
