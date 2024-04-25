local keymap = vim.keymap -- for conciseness
-- one word anotd
-- Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Define a function to set key mappings with a shared options table
local function map(mode, keys, command, description)
  local desc
  if type(command) == "string" then
    desc = description .. " (" .. command .. ")"
  else
    desc = description
  end
  local opts = { noremap = true, silent = true, desc = desc }
  keymap.set(mode, keys, command, opts)
end

-- Highlights
map("n", "<ESC>", "<cmd>nohlsearch<CR>", "Clear highlight on ESC")

-- File
map("n", "<leader>s", ":silent write<CR>", "Save file")
--map("n", "<leader>wq", ":wq<CR>", "Save and exit file")
map("n", "<leader>q", ":q!<CR>", "Force exit file")
map("n", "<leader>ff", ":lua vim.lsp.buf.format()<CR>", "Format file using lsp")

-- Window navigation
-- map("n", "<C-l>", "<C-w>l", "Move Right")
-- map("n", "<C-k>", "<C-w>k", "Move Up")
-- map("n", "<C-j>", "<C-w>j", "Move Down")
-- map("n", "<C-h>", "<C-w>h", "Move Left")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", "Increase current window size horizontally")
map("n", "<C-Down>", ":resize -2<CR>", "Decrease current window size horizontally")
map("n", "<C-Left>", ":vertical resize -2<CR>", "Decrease current window size vertically")
map("n", "<C-Right>", ":vertical resize +2<CR>", "Increase current window size vertically")

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", "Move to next buffer")
map("n", "<S-h>", ":bprevious<CR>", "Move to previous buffer")
map("n", "<leader>w", ":BufDel<CR>", "Delete current buffer") -- this is a plugin

-- Indent
map("v", "<", "<gv", "Indent right")
map("v", ">", ">gv", "Indent left")

-- Move text up and down
map("v", "K", ":m '<-2<CR>gv=gv", "Move selected line(s) up")
map("v", "J", ":m '>+1<CR>gv=gv", "Move selected line(s) down")

-- Yank tweaks
map("n", "<leader>y", '"+y', "Yank into the system clipboard")
map("v", "<leader>y", '"+y', "Yank into the system clipboard")
map("n", "<leader>Y", '"+Y', "Yank into the system clipboard")
map("v", "p", '"_dP', "Replace paste so it does not copy what you replaced")
map("n", "x", '"_x', "Do not yank with x")

-- Inside a file
map("n", "J", "mzJ`z", "Keep the cursor at place when joining the previous line")
map("n", "<C-d>", "<C-d>zz", "Center when moving multiple lines down")
map("n", "<C-u>", "<C-u>zz", "Center when moving multiple lines up")
map("n", "n", "nzzzv", "Keep cursor in the middle of the screen when searching for next ocurrence")
map("n", "N", "Nzzzv", "Keep cursor in the middle of the screen when searching for previous ocurrence")
map("n", "Q", "<nop>", "Disable Q because it's annoying to accidentally enter macro mode or similar")
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Search and replace current word")
map("n", "+", "<C-a>", "Increment number")
map("n", "-", "<C-x>", "Decrement number")
map("n", "<leader><S-a>", "gg<S-v>G", "Select all")

-- Splits
-- just do it natively. Ctrl-w + s / Ctrl-w + s
-- map("n", "<leader>vs", ":vsplit<Return>", "Vertical split")
-- map("n", "<leader>hs", ":split<Return>", "Horizontal split")

-- PLUGINS

-- Telescope
map("n", "<leader>p", ":Telescope find_files<CR>", "Find files")
map("n", "<leader>k", ":Telescope keymaps<CR>", "Show keymaps")
map("n", "<leader>b", ":Telescope buffers<CR>", "Show buffers")
map("n", "<leader><S-f>", ":Telescope live_grep<CR>", "Find in files")
map("n", "<leader>gb", ":Telescope git_branches<CR>", "Show git branches")
map("n", "<leader>gs", ":Telescope git_status<CR>", "Show git status")
map("n", "<leader>gl", ":Telescope git_commits<CR>", "Show git commits (git log)")
map("n", "<leader>gt", ":Telescope git_stash<CR>", "Show git stash")
--map("n", "<leader>n", ":Noice telescope<CR>", "Show notifications")

-- telescope-import
map("n", "<leader>I", ":Telescope import<CR>", "Show imports")

-- Mason
map("n", "<leader>m", ":Mason<CR>", "Show Mason")

-- gitgutter
map("n", "<leader>gd", ":GitGutterDiffOrig<CR>", "Show git diff")

-- Nvim-tree
map("n", "<leader>nt", ":NvimTreeToggle<CR>", "Toggle nvim tree")

-- nvim-treesitter-context
map("n", "<leader>n", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, "Jump to context (upwards)")

-- Lazy
map("n", "<leader>lz", ":Lazy<CR>", "Show Lazy window")

-- Trouble
map("n", "<leader>e", ":TroubleToggle<CR>", "Show trouble panel (errors, warnings, etc...)")

-- Todos
map("n", "<leader>t", ":TodoTelescope<CR>", "Show todos in telescope panel")

-- Zen mode
map("n", "<leader>f", ":ZenMode<CR>", "Zen mode full screen current file")

-- undotree
map("n", "<leader>u", ":UndotreeToggle<CR>", "Show undo tree")

-- bufferline
map("n", "<leader>y", ":BufferLineTogglePin<CR>", "Pin/Unpin tab")

-- lazygit
map("n", "<leader>lg", ":LazyGit<CR>", "Show LazyGit panel")

-- Lspasaga
map("n", "<leader>o", ":Lspsaga outline<CR>", "Show outline")
map("n", "<C-t>", ":Lspsaga term_toggle<CR>", "Show floating terminal")
map("n", "<leader>i", ":Lspsaga finder tyd+ref<CR>", "Show type definitions and references")
map("n", "<leader>d", ":Lspsaga goto_definition<CR>", "Go to definition")
map("n", "<leader>td", ":Lspsaga goto_type_definition<CR>", "Go to type definition")
map("n", "<leader>D", ":Lspsaga peek_definition<CR>", "Peek definition")
map("n", "<leader>tD", ":Lspsaga peek_type_definition<CR>", "Peek type definition")
map("n", "<leader>aa", ":Lspsaga code_action<CR>", "Show code actions")
map("n", "K", ":Lspsaga hover_doc<CR>", "Hover doc")
map("n", "<leader>rn", ":Lspsaga rename<CR>", "Rename")

-- session lens
map("n", "<leader>,", ":SearchSession<CR>", "Show sessions")

-- toggleterm
map("n", "<leader>.", ":ToggleTerm<CR>", "Remap C-\\ C-N to ESC to ease exiting terminal mode")
map("t", "<C-t>", "<C-\\><C-n>", "Remap C-\\ C-N to Ctrl+t to ease exiting terminal mode")

-- conform (formatter)
vim.keymap.set({ "n", "v" }, "<leader>/", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end, { desc = "Format file or range (in visual mode)" })
map("n", "<leader>?", ":ConformInfo<CR>", "Show formatter info (usually needed when formatting failed)")

-- Mini.map
-- map("n", "<leader>v", ":lua MiniMap.toggle()<CR>", "Toggle Minimap")

-- git.nvim
map("n", "<leader>gdf", ":GitDiff<CR>", "Show git diff of current file")

-- url-open
map("n", "<leader>O", ":URLOpenUnderCursor<CR>", "Open URL with default browser")
