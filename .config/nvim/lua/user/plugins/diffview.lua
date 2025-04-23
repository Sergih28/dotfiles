return { "sindrets/diffview.nvim" }

-- :DiffviewOpen [git rev] [options] [ -- {paths...}]

--Examples:
-- :DiffviewOpen
-- :DiffviewOpen HEAD~2
-- :DiffviewOpen HEAD~4..HEAD~2
-- :DiffviewOpen d4a7b0d
-- :DiffviewOpen d4a7b0d^!
-- :DiffviewOpen d4a7b0d..519b30e
-- :DiffviewOpen origin/main...HEAD

-- You can also provide additional paths to narrow down what files are shown:
-- :DiffviewOpen HEAD~2 -- lua/diffview plugin

-- Additional commands for convenience:
-- :DiffviewClose: Close the current diffview. You can also use :tabclose.
-- :DiffviewToggleFiles: Toggle the file panel.
-- :DiffviewFocusFiles: Bring focus to the file panel.
-- :DiffviewRefresh: Update stats and entries in the file list of the current Diffview.
