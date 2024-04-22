local function fileIcon()
  return ""
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local custom_nightfly = require("lualine.themes.nightfly")

    -- Change the background to transparent
    custom_nightfly.normal.b.bg = "NONE"
    custom_nightfly.normal.c.bg = "NONE"
    custom_nightfly.insert.b.bg = "NONE"
    custom_nightfly.visual.b.bg = "NONE"
    custom_nightfly.replace.b.bg = "NONE"
    custom_nightfly.command.b.bg = "NONE"
    custom_nightfly.inactive.b.bg = "NONE"

    return {
      options = {
        theme = custom_nightfly,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        -- lualine_b = {require('auto-session.lib').current_session_name, 'branch', 'diff', 'diagnostics'},
        lualine_b = { "diff", "diagnostics" },
        lualine_c = {
          {
            "filetype",
            icon_only = true,
            separator = "",
            icon = { align = "left" },
            padding = { left = 1, right = 0 },
          },
          {
            "filename",
            file_status = true,
            path = 1,
            symbols = {
              modified = "*",
            },
            separator = ">",
            color = { fg = "SkyBlue1" },
          },
          {
            fileIcon,
            separator = "",
            padding = { left = 1, right = 0 },
            color = { fg = "gold" },
          },
          {
            "filesize",
            color = { fg = "burlywood1" },
          },
        },
        lualine_x = {
          {
            "encoding",
            color = { fg = "aquamarine1" },
            padding = { left = 0, right = 0 },
            separator = "",
          },
          {
            "fileformat",
            color = { fg = "gold" },
            padding = { left = 1, right = 0 },
          },
          -- {
          --   'filetype',
          --   color = {fg='SkyBlue1'},
          -- }
        },
        lualine_y = {
          {
            "progress",
            padding = { left = 1, right = 0 },
            color = { fg = "SkyBlue1" },
            separator = "",
          },
          {
            "selectioncount",
            padding = { left = 1, right = 0 },
            color = { fg = "aquamarine1" },
            separator = "",
          },
          {
            "searchcount",
            padding = { left = 1, right = 0 },
            color = { fg = "burlywood1" },
            separator = "",
          },
          {
            "location",
            padding = { left = 0, right = 1 },
            separator = "",
          },
        },
        -- lualine_z = {'os.date(" %I:%M %p")'}
        lualine_z = {},
      },
    }
  end,
}
