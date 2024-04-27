return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  opts = {
    cmdheight = 2,
    restriction_mode = "hint", -- "block" is the default mode, but it blocks movement when it's not efficient, which I can find annoying
    disable_mouse = false, -- I think it's annoying if you just want to click or select something to copy with your mouse at some point if this is enabled (by default)
  },
}
