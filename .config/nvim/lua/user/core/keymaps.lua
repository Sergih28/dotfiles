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

-- Commands to remember
-- yap -> copy the current paragraph
-- ci" -> remove everything inside those "
-- == -> indent automatically the line

-- Define a function to set key mappings with a shared options table
local function map(mode, keys, command, description)
  -- local desc
  -- if type(command) == "string" then
  --   desc = description .. " (" .. command .. ")"
  -- else
  --   desc = description
  -- end
  local opts = { noremap = true, silent = true, desc = description }
  keymap.set(mode, keys, command, opts)
end

-- Highlights
map("n", "<ESC>", "<cmd>nohlsearch<CR>", "Clear highlight on ESC")

-- File
map("n", "<C-s>", ":silent write<CR>", "Save file")
--map("n", "<leader>wq", ":wq<CR>", "Save and exit file")
map("n", "<leader>q", ":q<CR>", "Exit file")
map("n", "<leader>Q", ":bufdo bdelete<CR>", "Close all open buffers")
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
map("n", "<C-f>", "<C-f>zz", "Center when moving one page down")
map("n", "<C-b>", "<C-b>zz", "Center when moving one page up")
map("n", "<C-d>", "<C-d>zz", "Center when moving half page down")
map("n", "<C-u>", "<C-u>zz", "Center when moving half page up")
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
map("n", "<leader>sh", ":Telescope help_tags<CR>", "[S]earch [H]elp")
map("n", "<leader>sk", ":Telescope keymaps<CR>", "[S]earch [K]eymaps")
map("n", "<leader>sf", ":Telescope find_files<CR>", "[S]earch [F]iles")
map("n", "<leader>ss", ":Telescope builtin<CR>", "[S]earch [S]elect Telescope")
map("n", "<leader>sw", ":Telescope grep_string<CR>", "[S]earch current [W]ord")
map("n", "<leader>sg", ":Telescope live_grep<CR>", "[S]earch by [G]rep")
map("n", "<leader>sd", ":Telescope diagnostics<CR>", "[S]earch [D]iagnostics")
map("n", "<leader>sr", ":Telescope resume<CR>", "[S]earch [R]esume")
map("n", "<leader>s.", ":Telescope oldfiles<CR>", '[S]earch Recent files ("." for repeat)')
map("n", "<leader><leader>", ":Telescope buffers<CR>", "[ ] Find existing buffers")
map("n", "<leader>fr", ":Telescope lsp_references<CR>", "Show references")
map("n", "gd", ":Telescope lsp_definitions<CR>", "[G]o to [D]efinition")
map("n", "gtd", ":Telescope lsp_type_definitions<CR>", "[G]o to [T]ype [D]efinition")
map("n", "<leader>ds", ":Telescope lsp_document_symbols<CR>", "[D]ocument [S]ymbols")
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", "Show [C]ode [A]ctions")
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", "Rename")
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", "Hover doc")
map("n", "]r", ":cnext<CR>", "Go to next reference")
map("n", "[r", ":cprev<CR>", "Go to prev reference")
-- There are some extra commands in the telescope file

--map("n", "<leader>n", ":Noice telescope<CR>", "Show notifications")

-- Diagnostics
map("n", "[d", function()
  vim.diagnostic.goto_prev()
end, "Go to previous [D]iagnostic message")
map("n", "]d", function()
  vim.diagnostic.goto_next()
end, "Go to next [D]iagnostic message")
map("n", "<leader>E", function()
  vim.diagnostic.open_float()
end, "Show diagnostic [E]rror messages")
-- I have a trouble bind to do this in a nicer way
-- map("n", "<leader>Q", function()
--   vim.diagnostic.setloclist()
-- end, "Open diagnostic [Q]uickfix list")

-- telescope-import
map("n", "<leader>I", ":Telescope import<CR>", "Show imports")

-- Mason
map("n", "<leader>m", ":Mason<CR>", "Show Mason")

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
map("n", "<leader>zm", ":ZenMode<CR>", "Zen mode full screen current file")

-- undotree
map("n", "<leader>u", ":UndotreeToggle<CR>", "Show undo tree")

-- bufferline
map("n", "<leader>y", ":BufferLineTogglePin<CR>", "Pin/Unpin tab")

-- git
map("n", "<leader>gb", ":Telescope git_branches<CR>", "Show git branches")
map("n", "<leader>gst", ":Telescope git_status<CR>", "Show git status")
map("n", "<leader>gstl", ":Telescope git_commits<CR>", "Show git commits (git log)")
map("n", "<leader>gt", ":Telescope git_stash<CR>", "Show git stash")
map("n", "<leader>lg", ":LazyGit<CR>", "Show LazyGit panel")
map("n", "<leader>gdf", ":GitDiff<CR>", "Show [G]it [D]i[f]f of current file")
map("n", "<leader>gc", ":Neogit commit<CR>", "[G]it [C]ommit")
map("n", "<leader>gp", ":Neogit pull<CR>", "[G]it [p]ull")
map("n", "<leader>gP", ":Neogit push<CR>", "[G]it [P]ush")
map("n", "<leader>ng", ":Neogit<CR>", "[N]eo[G]it")
map("n", "]c", ":Gitsigns next_hunk<CR>", "Git next hunk")
map("n", "[c", ":Gitsigns prev_hunk<CR>", "Git prev hunk")
map("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", "Git preview hunk")
map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", "Git reset hunk")
map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", "Git stage hunk")
map("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", "Git unstage hunk")

-- Lspasaga
map("n", "<leader>o", ":Lspsaga outline<CR>", "Show outline")
map("n", "<C-t>", ":Lspsaga term_toggle<CR>", "Show floating terminal")
map("n", "<leader>i", ":Lspsaga finder tyd+ref<CR>", "Show type definitions and references")
map("n", "<leader>D", ":Lspsaga peek_definition<CR>", "Peek definition")
map("n", "<leader>tD", ":Lspsaga peek_type_definition<CR>", "Peek type definition")

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

-- url-open
map("n", "<leader>O", ":URLOpenUnderCursor<CR>", "Open URL with default browser")

-- Markdown
map("n", "<leader>md", ":MarkdownPreview<CR>", "Open [M]arkdown [P]review")
map("n", "<leader>mds", ":MarkdownPreviewStop<CR>", "[M]arkdown [P]review [Stop]")
map("n", "<leader>mdt", ":MarkdownPreviewToggle<CR>", "[M]arkdown [P]review [T]oggle")

-- Obsidian
-- <leader>ch | Toggle checkboxes (it already applies this keybind by default)
map("n", "<leader>oo", ":ObsidianOpen<CR>", "[O]pen in [O]bsidian")
map("n", "<leader>ob", ":ObsidianBacklinks<CR>", "Open [O]bsidian [B]acklinks")
map("n", "<leader>ol", ":Obsidianlinks<CR>", "Open [O]bsidian [L]inks")
map("n", "<leader>on", ":ObsidianNew<CR>", "Add [O]bsidian [N]ew note")
map("n", "<leader>ot", ":ObsidianToday<CR>", "Open [O]bsidian [T]oday note")
map("n", "<leader>otp", ":ObsidianTemplate<CR>", "Insert [O]bsidian [T]emplate")

-- Hardtime
map("n", "<leader>htr", ":Hardtime report<CR>", "[H]ard[T]ime [R]eport")

-- Workspaces
map("n", "<leader>pj", ":Telescope workspaces<CR>", "Show [P]ro[J]ects")

-- Alternate toggler
map("n", "<leader>ta", ":ToggleAlternate<CR>", "[T]oggle [A]lternate")

-- Twighlight
map("n", "<leader>tt", ":Twighlight<CR>", "[T]wighlight [T]oggle")
