return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- To ensure Formatters and linters are installed
    -- Useful status updates for LSP
    {
      "j-hui/fidget.nvim",
      opts = {
        progress = {
          display = {
            done_icon = "🗸",
          },
        },
        notification = {
          window = {
            border = "single",
            winblend = 0,
          },
        },
      },
    },
    -- Autocompletion
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        -- Snippets
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
      config = function()
        local cmp = require("cmp")
        local custom_border = {
          "┌",
          "─",
          "┐",
          "│",
          "┘",
          "─",
          "└",
          "│",
        }

        cmp.setup({
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
          -- Set sharp window borders
          window = {
            completion = cmp.config.window.bordered({ border = custom_border }),
            documentation = cmp.config.window.bordered({ border = custom_border }),
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-Space>"] = cmp.mapping.complete(), -- on insert mode
            ["<C-e>"] = cmp.mapping.close(),
          }),
          sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" },
            { name = "buffer" },
          },
        })

        cmp.setup.cmdline({ "/", "?" }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        })

        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            { name = "cmdline" },
          }),
          matching = { disallow_symbol_nonprefix_matching = false },
        })
      end,
    },
    -- Treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      dependencies = {
        "windwp/nvim-ts-autotag", -- To rename and autoclose tags
        { "nvim-treesitter/nvim-treesitter-context", opts = { multiwindow = true } },
      },
      config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
          ensure_installed = {
            -- default parsers
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "elixir",
            "heex",
            "javascript",
            "html",
            -- custom parsers
            "astro",
            "bash",
            "comment",
            "css",
            "csv",
            "diff",
            "dockerfile",
            "editorconfig",
            "fish",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "gpg",
            "http",
            "ini",
            "jsdoc",
            "json",
            "luadoc",
            "markdown",
            "markdown_inline",
            "mermaid",
            "norg",
            "php",
            "phpdoc",
            "prisma",
            "python",
            "regex",
            "robots",
            "scss",
            "sql",
            "sxhkdrc",
            "tmux",
            "toml",
            "tsx",
            "twig",
            "typescript",
            "vue",
            "xml",
            "yaml",
            "yuck",
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
      end,
    },
    -- Formatter
    {
      "stevearc/conform.nvim",
      opts = {
        stop_after_first = true,
        formatters_by_ft = {
          javascript = { "prettierd", "prettier" },
          typescript = { "prettierd", "prettier" },
          javascriptreact = { "prettierd", "prettier" },
          typescriptreact = { "prettierd", "prettier" },
          css = { "prettierd", "prettier" },
          html = { "prettierd", "prettier" },
          json = { "prettierd", "prettier" },
          yaml = { "prettierd", "prettier" },
          markdown = { "markdownlint", "prettierd", "prettier" },
          lua = { "stylua" },
        },
      },
    },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("sergi-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
        map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        -- INLAY HINTS BABY! (need to set it up on the handlers below for every server, so now only set up for js/ts)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, "[T]oggle Inlay [H]ints")
        end

        -- This is needed so that with catppuccin theme we have some border to hover and diagnostics
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
        vim.lsp.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
        vim.diagnostic.config({
          float = {
            border = "single",
          },
        })
      end,
    })

    vim.api.nvim_create_autocmd("LspDetach", {
      group = vim.api.nvim_create_augroup("sergi-lsp-detach", { clear = true }),
      callback = function(event)
        vim.lsp.buf.clear_references()
        -- vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event.buf })
      end,
    })

    require("mason").setup({
      ui = {
        border = "single",
      },
      ensure_installed = {
        "prettierd",
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        -- CSS
        "css_variables",
        "cssls",
        "cssmodules_ls",
        "tailwindcss",

        -- Docker
        "docker_compose_language_service",
        "dockerls",

        -- JS/TS
        "eslint",
        "ts_ls",

        -- JSON
        "jsonls",

        -- PHP
        "intelephense",

        -- SQL
        "sqlls",

        -- OTHER
        "astro",
        "bashls",
        "yamlls",
        "diagnosticls",
        "html",
        "lua_ls",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,

        -- Add vim as global variable
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,

        -- Setup js/ts inlay hints
        ["ts_ls"] = function()
          require("lspconfig").ts_ls.setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            settings = {
              javascript = {
                inlayHints = {
                  includeInlayEnumMemberValueHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayVariableTypeHints = false,
                },
              },
              typescript = {
                inlayHints = {
                  includeInlayEnumMemberValueHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayVariableTypeHints = false,
                },
              },
            },
          })
        end,
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier", -- formatter
        "prettierd", -- formatter
        "markdownlint", -- formatter and linter
        "stylua", -- formatter
      },
    })
  end,
}
