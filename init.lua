-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.list = true

vim.opt.number = true

vim.g.lazyvim_mini_snippets_in_completion = true

require("keymap")
require("config.lazy")
require("config.menus")
require("config.mason")
require("config.format_on_save")
-- require("config.final_new_line")
require("config.spelling")
require("config.tabline")
require("config.nvimtree")
require("config.pqf")
require("lsp_init")

require("telescope").setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--ignore-file",
      ".gitignore",
    },
  },
})
