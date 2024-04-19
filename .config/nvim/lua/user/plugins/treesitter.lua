return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync" },
  config = function()
    require'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", -- do not delete this
      -- my custom parsers
      "astro",
      "bash",
      "clojure",
      "comment",
      "cpp",
      "css",
      "csv",
      "diff",
      "dockerfile",
      "fish",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "gpg",
      "graphql",
      "html",
      "htmldjango",
      "http",
      "ini",
      "java",
      "javascript",
      "jsdoc",
      "json",
      "json5",
      "kotlin",
      "latex",
      "markdown",
      "markdown_inline",
      "mermaid",
      "norg",
      "passwd",
      "php",
      "phpdoc",
      "prisma",
      "python",
      "regex",
      "ruby",
      "rust",
      "scala",
      "scss",
      "sql",
      "svelte",
      "sxhkdrc",
      "toml",
      "tsx",
      "twig",
      "typescript",
      "vim",
      "vimdoc",
      "vue",
      "xml",
      "yaml",
      "zig",
    },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }
  end;
}
