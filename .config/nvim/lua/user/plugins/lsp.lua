return {
  { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },

  --- Uncomment these if you want to manage LSP servers from neovim
  {
    "williamboman/mason.nvim",
    dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  },
  { "williamboman/mason-lspconfig.nvim" },

  -- LSP Support
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "rafamadriz/friendly-snippets" },
    },
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
      },
      { "onsails/lspkind.nvim" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "saadparwaiz1/cmp_luasnip" },
    },
  },
}
