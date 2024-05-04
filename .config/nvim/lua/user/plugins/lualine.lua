local function fileIcon()
  return ""
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    -- https://github.com/nvim-lualine/lualine.nvim/issues/614#issuecomment-1488293495
    local mode_map = {
      ["NORMAL"] = "N",
      ["O-PENDING"] = "N?",
      ["INSERT"] = "I",
      ["VISUAL"] = "V",
      ["V-BLOCK"] = "VB",
      ["V-LINE"] = "VL",
      ["V-REPLACE"] = "VR",
      ["REPLACE"] = "R",
      ["COMMAND"] = "!",
      ["SHELL"] = "SH",
      ["TERMINAL"] = "T",
      ["EX"] = "X",
      ["S-BLOCK"] = "SB",
      ["S-LINE"] = "SL",
      ["SELECT"] = "S",
      ["CONFIRM"] = "Y?",
      ["MORE"] = "M",
    }

    local function maximize_status()
      return vim.t.maximized and " " or ""
    end

    return {
      options = {
        theme = "catppuccin", --custom_nightfly,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(s)
              return mode_map[s] or s
              -- This would just show the first letter
              --   return s:sub(1, 1)
            end,
            separator = "",
          },
          { maximize_status, color = { bg = "NONE", fg = "#A6E3A1" } },
        },
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
        lualine_z = {},
      },
    }
  end,
}
