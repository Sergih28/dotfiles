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
      require("mini.pairs").setup({
        -- In which modes mappings from this `config` should be created
        modes = { insert = true, command = false, terminal = false },

        -- Global mappings. Each right hand side should be a pair information, a
        -- table with at least these fields (see more in |MiniPairs.map|):
        -- - <action> - one of 'open', 'close', 'closeopen'.
        -- - <pair> - two character string for pair to be used.
        -- By default pair is not inserted after `\`, quotes are not recognized by
        -- `<CR>`, `'` does not insert pair after a letter.
        -- Only parts of tables can be tweaked (others will use these defaults).
        mappings = {
          ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
          ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
          ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

          [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
          ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
          ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

          ['"'] = false, -- disable for this symbol because it is annoying
          ["'"] = false, -- disable for this symbol because it is annoying
          ["`"] = false, -- disable for this symbol because it is annoying

          -- default values, if you ever want to restore them
          -- ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
          -- ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
          -- ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
        },
      })
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
