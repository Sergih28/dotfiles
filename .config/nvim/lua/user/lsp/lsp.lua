local lsp_zero = require("lsp-zero")

--require("luasnip/loaders/from_vscode").lazy_load()

lsp_zero.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    -- LSP
    "astro",
    "clojure_lsp",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "emmet_ls",
    "eslint",
    "grammarly",
    "graphql",
    "html",
    "intelephense", --php
    "jdtls", --java
    "jsonls",
    "kotlin_language_server",
    "lua_ls",
    "sqlls",
    "tailwindcss",
    "tsserver",
    "vuels",
    "yamlls",
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "prettier", -- formatter
    "prettierd", -- formatter
    "markdownlint", -- formatter and linter
    "stylua", -- formatter
    "isort", -- python formatter
    "black", -- python formatter
    "pylint", -- linter
    "eslint_d", -- linter
  },
})

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
