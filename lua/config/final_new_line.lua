vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    -- Remove trailing white space
    vim.cmd([[%s/\s\+$//e]])
    -- Remove all EOF Lines
    vim.cmd([[%s/\($\n\s*\)\+\%$//e]])
    -- Insert Final New Line
    vim.api.nvim_buf_set_lines(0, -1, -1, true, { '' })

    vim.api.nvim_win_set_cursor(0, cursor_pos)
  end
})

