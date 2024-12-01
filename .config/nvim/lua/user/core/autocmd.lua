-- Groups
local augroup_highlight = vim.api.nvim_create_augroup("Highlight text", { clear = true })
local augroup_reload = vim.api.nvim_create_augroup("File reload", { clear = true })
local augroup_edit = vim.api.nvim_create_augroup("File edit", { clear = true })
local augroup_nothing = vim.api.nvim_create_augroup("Nothing", { clear = true })
local augroup_term = vim.api.nvim_create_augroup("Terminal", { clear = true })
local augroup_undotree = vim.api.nvim_create_augroup("Undotree", { clear = true })

-- Autocmds
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup_highlight,
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '300' })
  end,
})

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "CursorMoved", "CursorMovedI", "FocusGained" }, {
  group = augroup_reload,
  desc = "Reload file when moving your cursor and sometimes even without that (otherwise it just reloads by default when reentering the buffer)",
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  group = augroup_edit,
  desc = "Don't auto comment new line",
  pattern = "*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup_nothing,
  desc = "Map ctl+z to nothing so that it don't suspend terminal",
  pattern = "*",
  command = "nnoremap <c-z> <nop>",
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup_term,
  desc = "Go to insert mode after opening a terminal",
  pattern = "*",
  command = "startinsert",
})
