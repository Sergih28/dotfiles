return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
     -- add any options here
  },
  lazy = true,
  config = true -- runs require('Comment').setup()
}
