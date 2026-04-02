return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- Added this dependency
    },
    config = function()
      -- 1. Grab the modules once at the start
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
      -- 2. Define capabilities (Required for your completion.lua to work!)
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      mason.setup()

      mason_lspconfig.setup({
        ensure_installed = { "lua_ls", "pyright", "ts_ls" },
      })
    end,
    keys = {
      { "gd", vim.lsp.buf.definition, desc = "Go to Definition" },
      { "gr", vim.lsp.buf.references, desc = "References" },
      { "K", vim.lsp.buf.hover, desc = "Hover" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
      { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
    },
  },
}

