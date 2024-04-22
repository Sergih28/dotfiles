-- local colorscheme = "shades_of_purple"
local colorscheme = "nightfly"
-- local colorscheme = "tokyonight"
-- local colorscheme = "catppuccin"
-- local colorscheme = "night-owl"

return {
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.g.nightflyTransparent = true
      -- load the colorscheme here
      local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

      -- Line numbers
      vim.cmd("highlight CursorLineNr guifg=#ffe36a ctermfg=208")
      vim.cmd("highlight LineNrAbove guifg=#00a4cc ctermfg=208")
      vim.cmd("highlight LineNrBelow guifg=#00a4cc ctermfg=208")

      -- Normal text (file names)
      vim.cmd("highlight Normal guifg=white ctermfg=255")

      -- Setup colors to highlight for quick-scope (when using f, F, t, T on a line)
      vim.cmd("highlight QuickScopePrimary guifg=#facc15 gui=underline ctermfg=155 cterm=underline")
      vim.cmd("highlight QuickScopeSecondary guifg=#38bdf8 gui=underline ctermfg=81 cterm=underline")

      -- Window separations
      vim.cmd("highlight VertSplit guibg=NONE ctermbg=NONE guifg='#facc15' ctermfg=208")

      -- Telescope border
      vim.cmd("highlight TelescopeBorder guifg=#facc15 ctermfg=208")
      vim.cmd("highlight TelescopeTitle guifg=#facc15 ctermfg=208")

      -- NvimTree
      vim.cmd("highlight NvimTreeFolderIcon guifg=#facc15 ctermfg=208")
      vim.cmd("highlight NvimTreeIndentMarker guifg=#facc15 ctermfg=208")
      vim.cmd("highlight NvimTreeFolderName guifg=#facc15 ctermfg=208")
      vim.cmd("highlight NvimTreeOpenedFolderName guifg=#ffe36a ctermfg=208")
      vim.cmd("highlight NvimTreeRootFolder guifg=#e6b810 ctermfg=208")
      vim.cmd("highlight NvimTreeEmptyFolderName guifg=#d9a206 ctermfg=208")

      -- Normal floating windows
      vim.cmd("highlight NormalFloat guibg='#3b0764' ctermbg=3")

      -- Nvim treesitter context
      vim.cmd("highlight TreesitterContextBottom gui=underline guisp=White")
      vim.cmd("highlight TreesitterContextLineNumberBottom gui=underline guisp=White")
      vim.cmd("highlight TreesitterContextLineNumber guifg=#38bdf8 guibg=#3b0764 ctermfg=81 ctermbg=3")

      -- Text selection
      vim.cmd("highlight Visual guibg=#4a3c00 ctermbg=155")

      -- Current line
      vim.cmd("highlight CursorLine guibg='#3b0764' ctermbg=3")
      vim.cmd("highlight CursorLineNr guibg='#3b0764' ctermbg=3")
      vim.cmd("highlight NvimTreeCursorLine guibg='#3b0764' ctermbg=3")
      -- Mini Map Background
      vim.cmd("highlight MiniMapNormal guibg=NONE ctermbg=3")
      vim.cmd("highlight MiniMapSymbolCount guibg=NONE ctermbg=3")
      vim.cmd("highlight MiniMapSymbolLine guibg=NONE ctermbg=3")
      vim.cmd("highlight MiniMapSymbolView guibg=NONE ctermbg=3")

      -- Winbar
      vim.cmd("highlight WinBar guibg=NONE guifg=NONE")
      vim.cmd("highlight WinBarNC guibg=NONE guifg=NONE")

      if not status_ok then
        vim.notify("colorscheme " .. colorscheme .. " not found!")
        return
      end
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Setup colors to highlight for quick-scope (when using f, F, t, T on a line)
      vim.cmd("highlight QuickScopePrimary guifg='#facc15' gui=underline ctermfg=155 cterm=underline")
      vim.cmd("highlight QuickScopeSecondary guifg='#38bdf8' gui=underline ctermfg=81 cterm=underline")

      require("tokyonight").setup({
        transparent = true,
      })
    end,
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- Setup colors to highlight for quick-scope (when using f, F, t, T on a line)
      vim.cmd("highlight QuickScopePrimary guifg='#facc15' gui=underline ctermfg=155 cterm=underline")
      vim.cmd("highlight QuickScopeSecondary guifg='#38bdf8' gui=underline ctermfg=81 cterm=underline")

      require("catppuccin").setup({
        transparent_background = true,
      })
    end,
  },
  {
    "Rigellute/shades-of-purple.vim",
    priority = 1000,
    config = function()
      -- Setup colors to highlight for quick-scope (when using f, F, t, T on a line)
      vim.cmd("highlight QuickScopePrimary guifg='#facc15' gui=underline ctermfg=155 cterm=underline")
      vim.cmd("highlight QuickScopeSecondary guifg='#38bdf8' gui=underline ctermfg=81 cterm=underline")
    end,
  },
  {
    "haishanh/night-owl.vim",
  },
}
