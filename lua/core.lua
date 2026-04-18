vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard = "unnamedplus"

-- Completion capabilities must be defined before LSP config
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Mason: installs LSP servers
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "bashls", "clangd" },
})

-- New Neovim LSP API
vim.lsp.config("pyright", {
  capabilities = capabilities,
})

vim.lsp.config("bashls", {
  capabilities = capabilities,
})

vim.lsp.config("clangd", {
    capabilities = capabilities,
})

vim.lsp.enable("pyright")
vim.lsp.enable("bashls")
vim.lsp.enable("clangd")

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "luasnip" },
  },
})

