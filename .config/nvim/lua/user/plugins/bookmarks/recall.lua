return {
  "fnune/recall.nvim",
  config = function()
    require("recall").setup({})

    -- Get the name of the current working directory.
    local function cwd_name()
      return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    end

    -- This will create a shada file for each project to keep the bookmarks separate
    vim.opt.shadafile = os.getenv("HOME") .. "/shadas/" .. cwd_name() .. ".shada"
  end,
}

