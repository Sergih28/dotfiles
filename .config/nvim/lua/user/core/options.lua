local options = {
  -- file
  scrolloff = 8, -- number of lines to keep visible above and below the cursor
  confirm = true, -- ask confirmation when trying to close a file with unsaved changes

  -- line numbers
  relativenumber = true, -- show relative line numbers
  number = true, -- show absolute line number on the cursor line

  -- tabs & indentation
  tabstop = 2, -- set 2 spaces for tabs
  shiftwidth = 2, -- set 2 spaces for indent with
  expandtab = true, -- expand tab to spaces

  -- search settings
  ignorecase = true, -- ignore case when searching
  smartcase = true, -- if you include mixed case in your search, assumes you want case-sensitive

  -- cursor
  cursorline = true, -- highlight the current cursor line

  -- status line
  laststatus = 3, -- show only 1 status line regardless of the number of split windows

  -- splits
  splitright = true, -- new vertical split opens to the right (your cursor will be on the right window instead of the left one),
  splitbelow = true, -- new horizontal split opens to the bottom (your cursor will be on the bottom window instead of the top one)

  -- macros
  lazyredraw = true, -- see the end result of a macro straight away

  -- visual
  conceallevel = 2, -- necessary for obsidian notes to display markdown files cleaner

  -- spell check
  spell = true, -- activate spell check (specially good for comments)

  -- persist undo changes
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,

  -- other
  termguicolors = true, -- enable true color support
  updatetime = 250, -- shorter time for things like autocompletion to show up
}

-- Apply options
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Enable mouse for all modes
vim.o.mouse = "nvia"
