-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("blink-cmp")

require("luasnip.loaders.from_lua").lazy_load({
  paths = vim.fn.expand("~/dotfiles/nvim/.config/nvim/snippets"),
})

local lspconfig = require("lspconfig")

-- Create capabilities and DISABLE snippet support BEFORE clangd setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

-- clangd without placeholders
lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "-j=4",
    "--completion-style=detailed",
    "--enable-config",
    "--fallback-style=Google",
  },
  capabilities = capabilities,
})

require("snacks")

-- Default options:
require("kanagawa")
require("cord")
require("transparent")

-- setup must be called before loading

vim.cmd("colorscheme kanagawa-wave")

if vim.g.neovide then
  vim.o.guifont = "IosevkaTermSlab Nerd Font: h16"
end
