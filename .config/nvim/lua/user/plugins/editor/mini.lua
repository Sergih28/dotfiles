return {
  { "echasnovski/mini.trailspace", version = "*", config = true },
  { "echasnovski/mini.cursorword", version = "*", config = true },
  {
    "echasnovski/mini.pairs",
    version = "*",
    opts = {
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
    },
  },
}
