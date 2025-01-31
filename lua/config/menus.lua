local api = require 'nvim-tree.api'
local node = api.tree.get_node_under_cursor

local nvimtree = {

  {
    name = '  New file/folder',
    cmd = function()
      api.fs.create(node())
    end,
    rtxt = 'a',
  },

  { name = 'separator' },

  {
    name = '  Open in vertical split',
    cmd = function()
      api.node.open.vertical(node())
    end,
    rtxt = 'v',
  },

  {
    name = '  Open in horizontal split',
    cmd = function()
      api.node.open.horizontal(node())
    end,
    rtxt = 's',
  },

  {
    name = '󰓪  Open in new tab',
    cmd = function()
      api.node.open.tab(node())
    end,
    rtxt = 'O',
  },

  { name = 'separator' },

  {
    name = '  Cut',
    cmd = function()
      api.fs.cut(node())
    end,
    rtxt = 'x',
  },

  {
    name = '  Paste',
    cmd = function()
      api.fs.paste(node())
    end,
    rtxt = 'p',
  },

  {
    name = '  Copy',
    cmd = function()
      api.fs.copy.node(node())
    end,
    rtxt = 'c',
  },

  {
    name = '󰴠  Copy absolute path',
    cmd = function()
      api.fs.copy.absolute_path(node())
    end,
    rtxt = 'gy',
  },

  {
    name = '  Copy relative path',
    cmd = function()
      api.fs.copy.relative_path(node())
    end,
    rtxt = 'Y',
  },

  { name = 'separator' },

  {
    name = '  Rename',
    cmd = function()
      api.fs.rename(node())
    end,
    rtxt = 'r',
  },

  {
    name = '  Delete',
    hl = 'ExRed',
    cmd = function()
      api.fs.remove(node())
    end,
    rtxt = 'd',
  },
}

local default = {

  {
    name = 'Format Buffer',
    cmd = function()
      local ok, conform = pcall(require, 'conform')

      if ok then
        conform.format { lsp_fallback = true }
      else
        vim.lsp.buf.format()
      end
    end,
    rtxt = '<leader>fm',
  },

  {
    name = 'Code Actions',
    cmd = vim.lsp.buf.code_action,
    rtxt = '<leader>ca',
  },

  { name = 'separator' },

  {
    name = 'Lsp Actions',
    hl = 'Exblue',
    items = 'lsp',
  },

  { name = 'separator' },

  {
    name = 'Edit Config',
    cmd = function()
      vim.cmd 'tabnew'
      local conf = vim.fn.stdpath 'config'
      vim.cmd('tcd ' .. conf .. ' | e init.lua')
    end,
    rtxt = 'ed',
  },

  {
    name = 'Copy Content',
    cmd = '%y+',
    rtxt = '<C-c>',
  },

  {
    name = 'Delete Content',
    cmd = '%d',
    rtxt = 'dc',
  },

  { name = 'separator' },

  {
    name = '  Open in terminal',
    hl = 'ExRed',
    cmd = function()
      local old_buf = require('menu.state').old_data.buf
      local old_bufname = vim.api.nvim_buf_get_name(old_buf)
      local old_buf_dir = vim.fn.fnamemodify(old_bufname, ':h')

      local cmd = 'cd ' .. old_buf_dir

      -- base46_cache var is an indicator of nvui user!
      if vim.g.base46_cache then
        require('nvchad.term').new { cmd = cmd, pos = 'sp' }
      else
        vim.cmd 'enew'
        vim.fn.termopen { vim.o.shell, '-c', cmd .. ' ; ' .. vim.o.shell }
      end
    end,
  },
}

vim.keymap.set({ 'n', 'v' }, '<RightMouse>', function()
  require('menu.utils').delete_old_menus()

  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == 'NvimTree' and nvimtree or default

  require('menu').open(options, { mouse = true })
end, {})

