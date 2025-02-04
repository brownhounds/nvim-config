vim.opt.foldlevel = 20   -- Set initial fold level
vim.opt.foldcolumn = '1' -- Show fold column
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext = 'v:lua.vim.treesitter.foldtext()'

