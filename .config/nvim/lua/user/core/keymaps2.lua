-- Define a function to set key mappings with a shared options table
local function map(mode, keys, command, desc)
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, keys, command, opts)
end

local function dismiss_notifications()
  require("notify").dismiss({
    -- This params do not seem necessary, but just making the keybind less invasive
    -- in case in the future I have other types of notifications
    pending = false, -- Do not clear pending notifications
    silent = false, -- Do not suppress notification that pending notifications were dismissed.
  })
end

-- Hydrate
map("n", "<leader>hc", dismiss_notifications, "[H]ydrate [C]lose")
