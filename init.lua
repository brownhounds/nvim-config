-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.list = true

vim.opt.number = true

vim.g.lazyvim_mini_snippets_in_completion = true

require('keymap')
require('config.lazy')
require('config.menus')
require('config.mason')
require('config.format_on_save')
require('config.final_new_line')
require('config.spelling')
require('config.tabline')
require('config.nvimtree')
require('config.pqf')
require('config.folds')
require('lsp_init')

