local options = {
  termguicolors = true, -- needed for bufferline

  -- file asdf
  scrolloff = 8, -- number of lines to keep above and below the cursor

  -- line numbers
  relativenumber = true, -- show relative line numbers
  number = true, -- show absolute lien number on cursor line (when relative number is on)

  -- tabs & indentation
  tabstop = 2, -- 2 spaces for tabs (prettier default)
  shiftwidth = 2, -- 2 spaces for indent width
  expandtab = true, -- expand tab to spaces
  autoindent = true, -- copy indent from current line when starting new one

  -- appearance

  -- search settings
  ignorecase = true, -- ignore case when searching
  smartcase = true, -- if you include mixed case in your search, assumes you want case-sensitive

  -- cursor line
  cursorline = true, -- highlight the current cursor line

  -- split windows
  splitright = true, -- split vertical window to the right
  splitbelow = true, -- split horizontal window to the bottom

  -- read undos from the past (longer in time)
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,

  -- Make statusline always 100%, otherwise multiple statuslines are seen for each split
  ls = 3,
}

-- use system clipboard as default register
local is_mac = vim.fn.has("macunix")
local is_unix = vim.fn.has("unix")
local is_windows = vim.fn.has("win32")

if is_mac or is_unix then
  vim.opt.clipboard:append({ "unnamedplus" })
end
if is_windows then
  vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
end

--vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0 -- otherwise 4 is applied on those files

-- Add spell check for comments
vim.cmd("set spell")

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Set ColorColumn to match the normal background color
vim.cmd("highlight ColorColumn guibg=NONE ctermbg=NONE")

vim.o.ttymouse = "xterm2"
vim.o.mouse = "nvia"
