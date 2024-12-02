vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Define a function to set key mappings with a shared options table
local function map(mode, keys, command, desc)
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, keys, command, opts)
end

-- NATIVE REMAPS

-- Highlights
map("n", "<ESC>", "<cmd>nohlsearch<CR>", "Clear highlight on ESC")

-- File
map("n", "<C-s>", ":silent write<CR>", "Save file")
map("n", "<leader>q", ":q<CR>", "Exit file")

-- Move text up and down
map("v", "K", ":m '<-2<CR>gv=gv", "Move selected line(s) up")
map("v", "J", ":m '>+1<CR>gv=gv", "Move selected line(s) down")

-- Resize windows with arrows
map("n", "<C-Up>", ":resize +2<CR>", "Increase current window size horizontally")
map("n", "<C-Down>", ":resize -2<CR>", "Decrease current window size horizontally")
map("n", "<C-Left>", ":vertical resize -2<CR>", "Decrease current window size vertically")
map("n", "<C-Right>", ":vertical resize +2<CR>", "Increase current window size vertically")

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", "Move to next buffer")
map("n", "<S-h>", ":bprevious<CR>", "Move to previous buffer")

-- Indent
map("v", "<", "<gv", "Indent right")
map("v", ">", ">gv", "Indent left")

-- Yank tweaks
map("n", "<leader>cb", ":reg<CR>", "Check clipboard")
map("v", "p", '"_dP', "Replace paste so it does not copy what you replaced")

-- Inside a file
map("n", "*", function() vim.cmd("normal! *") vim.cmd("normal! N") end, "Remap * to stay in the first word")
map("n", "<leader><S-a>", "gg<S-v>G$", "Select all")
map("n", "<C-f>", "<C-f>zz", "Center when moving one page down")
map("n", "<C-b>", "<C-b>zz", "Center when moving one page up")
map("n", "<C-d>", "<C-d>zz", "Center when moving half page down")
map("n", "<C-u>", "<C-u>zz", "Center when moving half page up")
map("n", "n", "nzzzv", "Keep cursor in the middle of the screen when searching for next ocurrence")
map("n", "N", "Nzzzv", "Keep cursor in the middle of the screen when searching for previous ocurrence")
map("n", "J", "mzJ`z", "Keep the cursor at place when joining the previous line")
map("n", "+", "<C-a>", "Increment number")
map("n", "-", "<C-x>", "Decrement number")

-- Diagnostics
map("n", "<leader>E", function() vim.diagnostic.open_float() end, "Show diagnostic [E]rror messages")
-- The next 2 keybinds, are the native ones but
-- it opens the preview of the diagnostic, and it centers it on the window
map("n", "[d", function()
  vim.diagnostic.goto_prev()
  vim.cmd("normal! zz")
end, "Go to previous [D]iagnostic message")
map("n", "]d", function()
  vim.diagnostic.goto_next()
  vim.cmd("normal! zz")
end, "Go to next [D]iagnostic message")
