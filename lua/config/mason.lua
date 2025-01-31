require('mason').setup()
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = { 'lua_ls' }
})

vim.diagnostic.config({
  virtual_text = {
    prefix = '',
    spacing = 4,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    }
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

