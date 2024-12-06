-- Backup the original vim.notify function
local original_notify = vim.notify

--------------------------------------------------------------------------------
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "user.plugins" },
    { import = "user.plugins.bookmarks" },
    { import = "user.plugins.colorscheme" },
    { import = "user.plugins.editor" },
    { import = "user.plugins.file_navigation" },
    { import = "user.plugins.git" },
    { import = "user.plugins.health" },
    { import = "user.plugins.info" },
    { import = "user.plugins.lsp" },
    { import = "user.plugins.notifications" },
    { import = "user.plugins.screenshot" },
    { import = "user.plugins.stats" },
    { import = "user.plugins.statusline" },
  },
  ui = {
    border = "single",
  },
  -- disable automatically check for plugin updates
  checker = { enabled = false },
})
--------------------------------------------------------------------------------

-- Setup nvim-notify only for hydrate notifications
local notify = require("notify")
local hydrate = require("user.plugins.health.hydrate")

-- Override vim.notify to filter Hydrate notifications
vim.notify = function(msg, log_level, opts)
  -- Check if the notification comes from "hydrate"
  if opts and opts.title and opts.title:lower():gsub("%s", "") == "hydrate" then
    opts.title = "💧💧💧💧💧" -- not seen but in case I change the notification style in the future
    opts.hide_from_history = true

    -- Very short timeout for when I just had a drink or check how much time is left fo the next one, so I don't have to manually clear the notification
    -- Very long timeout for when I have to drink, so that I don't miss the notification and have to manually clear it
    opts.timeout = hydrate.opts.msg_hydrate_now == msg and 999999 or 0

    notify(msg, log_level, opts)
  else
    -- Otherwise, use the default Neovim notification
    original_notify(msg, log_level, opts)
  end
end
