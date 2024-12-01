return {
  "rmagatti/alternate-toggler",
  event = { "BufReadPost" },
  config = function()
    require("alternate-toggler").setup({
      alternates = {
        ["true"] = "false", -- included in default config
        ["True"] = "False", -- included in default config
        ["TRUE"] = "FALSE", -- included in default config
        ["Yes"] = "No", -- included in default config
        ["YES"] = "NO", -- included in default config
        ["1"] = "0", -- included in default config
        ["<"] = ">", -- included in default config
        ["("] = ")", -- included in default config
        ["["] = "]", -- included in default config
        ["{"] = "}", -- included in default config
        ['"'] = "'", -- included in default config
        ['""'] = "''", -- included in default config
        ["+"] = "-", -- included in default config
        ["==="] = "!==", -- included in default config
        ["=="] = "!=",
      },
    })
  end,
}
