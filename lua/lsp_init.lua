local config = require('lspconfig')

config.lua_ls.setup({})
config.ts_ls.setup({})
config.clangd.setup({})
config.gopls.setup({})
config.ols.setup({})
config.omnisharp.setup({
  handlers = {
    ['textDocument/definition'] = require('omnisharp_extended').definition_handler,
    ['textDocument/typeDefinition'] = require('omnisharp_extended').type_definition_handler,
    ['textDocument/references'] = require('omnisharp_extended').references_handler,
    ['textDocument/implementation'] = require('omnisharp_extended').implementation_handler,
  },
})
