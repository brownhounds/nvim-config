vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    -- Skip binary files or unmodifiable buffers
    if vim.bo.binary or not vim.bo.modifiable then
      return
    end

    local buf = vim.api.nvim_get_current_buf()

    -- Save the current undo setting
    local saved_undolevels = vim.o.undolevels
    -- Disable recording these changes in the undo tree
    vim.o.undolevels = -1

    -- Remove trailing whitespace from all lines.
    vim.cmd([[%s/\s\+$//e]])

    -- Get the current buffer lines after whitespace removal
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, true)

    -- If the file is non-empty and the last line is not empty,
    -- append an empty line (i.e. add the final newline)
    if #lines > 0 and lines[#lines] ~= '' then
      vim.api.nvim_buf_set_lines(buf, #lines, #lines, true, { '' })
    end

    -- Restore the original undo setting
    vim.o.undolevels = saved_undolevels
  end,
})

