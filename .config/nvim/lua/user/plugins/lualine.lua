local function fileIcon()
  return ""
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    -- local custom_nightfly = require("lualine.themes.nightfly")
    --
    -- -- Change the background to transparent
    -- custom_nightfly.normal.b.bg = "NONE"
    -- custom_nightfly.normal.c.bg = "NONE"
    -- custom_nightfly.insert.b.bg = "NONE"
    -- custom_nightfly.visual.b.bg = "NONE"
    -- custom_nightfly.replace.b.bg = "NONE"
    -- custom_nightfly.command.b.bg = "NONE"
    -- custom_nightfly.inactive.b.bg = "NONE"

    return {
      options = {
        theme = "catppuccin", --custom_nightfly,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "branch",
            color = { bg = "NONE" },
          },
          {
            "diff",
            color = { bg = "NONE" },
          },
          {
            "diagnostics",
            color = { bg = "NONE" },
          },
        },
        lualine_c = {
          {
            "filetype",
            icon_only = true,
            separator = "",
            icon = { align = "left" },
            padding = { left = 1, right = 0 },
            color = { bg = "NONE" },
          },
          {
            "filename",
            file_status = true,
            path = 1,
            symbols = {
              modified = "*",
            },
            separator = ">",
            color = { bg = "NONE", fg = "#87B0F9" },
          },
          {
            fileIcon,
            separator = "",
            padding = { left = 1, right = 0 },
            color = { bg = "NONE", fg = "#FAB387" },
          },
          {
            "filesize",
            color = { bg = "NONE", fg = "#A6E3A1" },
          },
        },
        lualine_x = {
          {
            "encoding",
            color = { bg = "NONE", fg = "#CBA6F7" },
            padding = { left = 0, right = 0 },
            separator = "",
          },
          {
            "fileformat",
            color = { bg = "NONE", fg = "#FAB387" },
            padding = { left = 1, right = 0 },
          },
          -- {
          --   'filetype',
          --   color = {fg='#87B0F9'},
          -- }
        },
        lualine_y = {
          {
            "progress",
            padding = { left = 1, right = 0 },
            color = { bg = "NONE", fg = "#87B0F9" },
            separator = "",
          },
          {
            "selectioncount",
            padding = { left = 1, right = 0 },
            color = { bg = "NONE", fg = "#CBA6F7" },
            separator = "",
          },
          {
            "searchcount",
            padding = { left = 1, right = 0 },
            color = { bg = "NONE", fg = "#A6E3A1" },
            separator = "",
          },
          {
            "location",
            padding = { left = 0, right = 1 },
            color = { bg = "NONE" },
            separator = "",
          },
        },
        -- lualine_z = {'os.date(" %I:%M %p")'}
        lualine_z = {},
      },
    }
  end,
}
