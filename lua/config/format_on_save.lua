vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  callback = function()
    vim.lsp.buf.format()
  end,
})


vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.js',
  callback = function()
    vim.lsp.buf.format()
  end,
})

