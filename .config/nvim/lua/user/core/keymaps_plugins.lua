-- Used for the keybind to search for the current selection
function vim.getVisualSelection()
	local current_clipboard_content = vim.fn.getreg('"')

	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	vim.fn.setreg('"', current_clipboard_content)

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

-- Define a function to set key mappings with a shared options table
local function map(mode, keys, command, desc)
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, keys, command, opts)
end

-- PLUGINS REMAPS

-- BufDel
map("n", "<leader>w", ":BufDel<CR>", "Delete current buffer") -- this is a plugin

-- Lazy (package manager)
map("n", "<leader>lz", ":Lazy<CR>", "Show Lazy window")

-- Mason
map("n", "<leader>ms", ":Mason<CR>", "Show Mason")

-- Lazydocker
map("n", "<leader>ld", ":LazyDocker<CR>", "Show Lazydocker")

-- Git related
-- There are some more keymaps in the git.lua plugin file (they need to be there)
map("n", "<leader>lg", ":LazyGit<CR>", "Show LazyGit panel")
map("n", "<leader>gb", ":Telescope git_branches<CR>", "Show git branches (Telescope)")
map("n", "<leader>gst", ":Telescope git_status<CR>", "Show git status (Telescope)")
map("n", "<leader>glg", ":Telescope git_commits<CR>", "Show git commits (git log) (Telescope)")
map("n", "<leader>gt", ":Telescope git_stash<CR>", "Show git stash (Telescope)")
map("n", "<leader>lo", ":Telescope treesitter<CR>", "[L]ist [O]utline (Treesitter) (Telescope)")
map("n", "<leader>gdf", ":GitDiff<CR>", "Show [G]it [D]i[f]f of current file")
map("n", "]h", ":Gitsigns next_hunk<CR>zz", "Git next hunk")
map("n", "[h", ":Gitsigns prev_hunk<CR>zz", "Git prev hunk")
map("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", "Git preview hunk")
map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", "Git reset hunk")
map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", "Git stage hunk")
map("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", "Git unstage hunk")

-- Telescope
map("n", "<leader>i", ":Telescope import<CR>", "[I]mport modules (Telescope)")
map("n", "<leader>fb", ":Telescope file_browser<CR>", "[F]ile [B]rowser (Telescope)")
map("n", "<leader>sh", ":Telescope help_tags<CR>", "[S]earch [H]elp (Telescope)")
map("n", "<leader>sk", ":Telescope keymaps<CR>", "[S]earch [K]eymaps (Telescope)")
map("n", "<leader>sf", ":Telescope find_files<CR>", "[S]earch [F]iles (Telescope)")
map("n", "<leader>ss", ":Telescope builtin<CR>", "[S]earch [S]elect Telescope")
map({ "n" }, "<leader>sw", ":Telescope grep_string<CR>", "[S]earch current [W]ord (Telescope)")
map("v", "<leader>pws", function() require('telescope.builtin').grep_string({ search = vim.getVisualSelection() }) end, "Search Selection (Telescope)")
map("v", "<leader>pWs", function() require('telescope.builtin').grep_string({ search = vim.getVisualSelection(), grep_open_files = true, prompt_title = "Grep string in Open Files" }) end, "[S]earch Selection in Open Files (Telescope)")
map("n", "<leader>s/", function()
  require("telescope.builtin").live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end, "[S]earch [/] in Open Files (Telescope)" )
map("n", "<leader>snv", function()
  require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
end, "[S]earch [N]eovim files")
map("n", "<leader>se", function() require("telescope.builtin").symbols{ sources = {'emoji'} } end, "[S]earch [E]moji (Telescope)")
map("n", "<leader>sg", ":Telescope live_grep<CR>", "[S]earch by [G]rep (Telescope)")
map("n", "<leader>sd", ":Telescope diagnostics<CR>", "[S]earch [D]iagnostics (Telescope)")
map("n", "<leader>sr", ":Telescope resume<CR>", "[S]earch [R]esume (Telescope)")
map("n", "<leader>s.", ":Telescope oldfiles<CR>", "[S]earch Recent files ('.' for repeat) (Telescope)")
map("n", "<leader>sq", ":Telescope quickfix<CR>", "[S]earch [Q]uickfix (Telescope)")
map("n", "<leader><leader>", ":Telescope buffers<CR>", "[ ] Find existing buffers (Telescope)")
map("n", "gr", ":Telescope lsp_references<CR>", "[G]o to [R]eferences (Telescope)")
map("n", "gd", ":Telescope lsp_definitions<CR>", "[G]o to [D]efinition (Telescope)")
map("n", "gI", ":Telescope lsp_implementations<CR>", "[G]o to [I]mplementation (Telescope)")
map("n", "gD", vim.lsp.buf.declaration, "[G]o to [D]eclaration")
map("n", "<leader>D", ":Telescope lsp_type_definitions<CR>", "[G]o to [T]ype [D]efinition (Telescope)")
map("n", "<leader>ds", ":Telescope lsp_document_symbols<CR>", "[D]ocument [S]ymbols (Telescope)")
map("n", "<leader>ca", vim.lsp.buf.code_action, "Show [C]ode [A]ctions")
map("n", "<leader>ws", ":Telescope lsp_dynamic_workspace_symbols<CR>", "Show [W]orkspace [S]ymbols (Telescope)")
-- map("n", "<leader>rn", vim.lsp.buf.rename, "Rename") -- Replaced with live-rename plugin
map("n", "K", vim.lsp.buf.hover, "Hover doc")
map("n", "]r", ":cnext<CR>zz", "Go to next reference")
map("n", "[r", ":cprev<CR>zz", "Go to prev reference")

-- Harpoon
-- This keymaps are in the harpoon.lua file, as they need to be there

-- Nvim-tree
map("n", "<leader>nt", ":NvimTreeToggle<CR>", "Toggle nvim tree")

-- Oil
map("n", "<leader>oil", ":Oil<CR>", "Show Oil file viewer")

-- Undotree
map("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", "Show undo tree")

-- Hydrate
map("n", "<leader>hw", ":HydrateWhen<CR>", "[H]ydrate [W]hen")
map("n", "<leader>hn", ":HydrateNow<CR>", "[H]ydrate [N]ow")

-- Codesnap (code screenshots)
map("v", "<leader>cc", ":CodeSnap<CR>", "[C]odeSnap [C]opy")
map("v", "<leader>cs", ":CodeSnapSave<CR>", "[C]odeSnap [S]ave")

-- Flash
map({ "n" }, "<leader>ss", function()
  local flash = require("flash")

  local word_under_cursor = vim.fn.expand("<cword>")
  local search_pattern = vim.fn.getreg("/")

  if search_pattern == "\\<" .. word_under_cursor .. "\\>" then
    flash.jump({ pattern = word_under_cursor })
  else
    flash.jump()
  end
end, "[F]lash")
map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, "[F]lash [T]reesitter")
map("o", "r", function() require("flash").remote() end, "[F]lash [R]emote")
map({ "o", "x" }, "R", function() require("flash").treesitter_search() end, "[F]lash [T]reesitter [S]earch")
map("c", "<c-s>", function() require("flash").toggle() end, "[F]lash [T]oggle [S]earch")
-- map("n", "*", function() vim.cmd("normal! *") vim.cmd("normal! N") require("flash").jump({pattern = vim.fn.expand("<cword>")}) end, "[F]lash [W]ord [U]nder [C]ursor")

-- Markdown Preview
map("n", "<leader>md", ":MarkdownPreview<CR>", "Open [M]arkdown [P]review")
map("n", "<leader>mds", ":MarkdownPreviewStop<CR>", "[M]arkdown [P]review [S]top")
map("n", "<leader>mdt", ":MarkdownPreviewToggle<CR>", "[M]arkdown [P]review [T]oggle")

-- Cloak (hide sensitive string like in .env)
map("n", "<leader>tp", ":CloakToggle<CR>", "[T]oggle [P]assword")

-- Trouble
map("n", "<leader>e", "<cmd>Trouble diagnostics toggle<cr>", "Show trouble panel (errors, warnings, etc...)")
map("n", "<leader>tt", ":TodoTrouble<cr>", "Show todo trouble panel") -- And todo comments plugin
map("n", "<leader>tl", ":TodoTelescope<cr>", "Show todos on Telescope") -- And todo comments plugin
map("n", "<leader>tq", ":TodoQuickFix<cr>", "Show todos on a QuickFix list") -- And todo comments plugin

-- Recall (Bookmarks)
map("n", "<leader>bt", ":RecallToggle<CR>", "[B]ookmark [T]oggle")
map("n", "]b", ":RecallNext<CR>", "[B]ookmark Next")
map("n", "[b", ":RecallPrevious<CR>", "[B]ookmark Previous")
map("n", "<leader>bd", ":RecallClear<CR>", "[B]ookmark [D]elete")
map("n", "<leader>bl", ":Telescope recall<CR>", "[B]ookmark [L]ist")

-- Hardtime
map("n", "<leader>htr", ":Hardtime report<CR>", "[H]ard[T]ime [R]eport")

-- Conform (formatter)
map("n", "<leader>/", function() require("conform").format({ async = true }) end, "[F]ormat buffer")

-- Treesj (toggle returns and similar)
map("n", "<leader>tr", ":TSJToggle<CR>", "[T]sj Toggle [R]eturn")

-- Treesitter context
map("n", "<leader>ts", ":TSContextToggle<CR>", "[T]oggle [S]ticky Lines (Treesitter)")
map("n", "<leader>n", function() require("treesitter-context").go_to_context(vim.v.count1) end, "Jump to context (upwards) (Treesitter)")

-- Debug (nvim-dap and related)
map("n", "<leader>dv", function() require("dapui").toggle() end, "Toggle [D]ebug [V]iew")
map("n", "<leader>dmv", ":DapToggleRepl<CR>", "Toggle [D]ebug [M]ini [V]iew")
map("n", "<leader>drv", function() require("dapui").open({ reset = true }) end, "[D]ebug [R]eset [V]iew")
map("n", "<leader>dc", ":DapContinue<CR>", "[D]ebug [C]ontinue (or Start)")
map("n", "<leader>dki", function() require("dap.ui.widgets").hover() end, "[D]ebug [K] Show Variable [I]nfo")
map("n", "<leader>dks", function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes) end,
"[D]ebug [K] Show [S]copes")
map("n", "<leader>dkf", function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames) end,
"[D]ebug [K] Show [F]rames")
map("n", "<leader>dks", function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes) end,
"[D]ebug [K] Show Variable Info")
map("n", "<leader>dC", function() require("dap").run_to_cursor() end, "[D]ebug to [C]ursor")
map("n", "<leader>dO", ":DapStepOut<CR>", "[D]ebug Step [O]ut")
map("n", "<leader>di", ":DapStepInto<CR>", "[D]ebug Step [I]nto")
map("n", "<leader>do", ":DapStepOver<CR>", "[D]ebug Step [O]ver")
map("n", "<leader>du", function() require("dap").up() end, "[D]ebug [U]p")
map("n", "<leader>dd", function() require("dap").down() end, "[D]ebug [D]own")
map("n", "<leader>dL", function() require("dap").run_last() end, "[D]ebug Run [L]ast")
map("n", "<leader>dr", function() require("dap").restart() end, "[D]ebug [R]estart")
map("n", "<leader>dp", ":DapPause<CR>", "[D]ebug [P]ause")
map("n", "<leader>dt", ":DapTerminate<CR>", "[D]ebug [T]erminate")
map("n", "<leader>dD", ":DapDisconnect<CR>", "[D]ebug [D]isconnect")
-- map("n", "<leader>dbt", ":DapToggleBreakpoint<CR>", "[D]ebug [B]reakpoint [T]oggle")
-- map("n", "<leader>dBt", function() require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, "[D]ebug Conditional [B]reakpoint [T]oggle")
-- map("n", "<leader>dbc", ":DapClearBreakpoints<CR>", "[D]ebug [B]reakpoints [C]lear")
-- map("n", "<leader>dl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, "[D]ebug [L]ogpoint")
map("n", "<leader>db", ":PBToggleBreakpoint<CR>", "[D]ebug [B]reakpoint [T]oggle")
map("n", "<leader>dB", ":PBSetConditionalBreakpoint<CR>", "[D]ebug Conditional [B]reakpoint [T]oggle")
map("n", "<leader>dbc", ":PBClearAllBreakpoints<CR>", "[D]ebug [B]reakpoints [C]lear")
map("n", "<leader>dl", ":PBSetLogPoint<CR>", "[D]ebug [L]ogpoint")

-- ZenMode
map("n", "<leader>ft", ":ZenMode<CR>", "[F]ullscreen [T]oggle (Maximize) (Zen mode)")

-- Window picker
map("n", "<leader>cw", ":WindowPick<CR>", "[C]hange (Pick) [W]indow")

-- Live rename
map("n", "<leader>rn", function () require("live-rename").rename({ insert = true }) end, "[R]ename")

-- CSVView
map("n", "<leader>csv", ":CsvViewToggle display_mode=border header_lnum=1<CR>", "Toggle [C][S][V] View")

-- DiffView
map("n", "<leader>gda", ":DiffviewOpen<CR>", "[G]it [D]iff [A]ll")
map("n", "<leader>gdc", ":DiffviewClose<CR>", "[G]it [D]iff [C]lose")
map("n", "<leader>gdt", ":DiffviewToggleFiles<CR>", "[G]it [D]iff Toggle [T]ree (Files)")

-- Neogen
map("n", "<leader>ga", ":Neogen func<CR>", "[G]enerate (function) [A]nnotation with Neogen")
