-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.list = true

require("keymap")
require("config.lazy")

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        -- Remove trailing whitespace
        vim.cmd([[%s/\s\+$//e]])
        -- Remove all EOF Lines
	vim.cmd([[%s/\($\n\s*\)\+\%$//e]])
	-- Insert Final New Line
        vim.api.nvim_buf_set_lines(0, -1, -1, true, { "" })
    end,
})

