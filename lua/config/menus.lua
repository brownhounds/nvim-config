local api = require("nvim-tree.api")
local node = api.tree.get_node_under_cursor

local nvimtree = {

  {
    name = "  New file/folder",
    cmd = function()
      api.fs.create(node())
    end,
    rtxt = "a",
  },

  { name = "separator" },

  {
    name = "  Open in vertical split",
    cmd = function()
      api.node.open.vertical(node())
    end,
    rtxt = "v",
  },

  {
    name = "  Open in horizontal split",
    cmd = function()
      api.node.open.horizontal(node())
    end,
    rtxt = "s",
  },

  {
    name = "󰓪  Open in new tab",
    cmd = function()
      api.node.open.tab(node())
    end,
    rtxt = "O",
  },

  { name = "separator" },

  {
    name = "  Cut",
    cmd = function()
      api.fs.cut(node())
    end,
    rtxt = "x",
  },

  {
    name = "  Paste",
    cmd = function()
      api.fs.paste(node())
    end,
    rtxt = "p",
  },

  {
    name = "  Copy",
    cmd = function()
      api.fs.copy.node(node())
    end,
    rtxt = "c",
  },

  {
    name = "󰴠  Copy absolute path",
    cmd = function()
      api.fs.copy.absolute_path(node())
    end,
    rtxt = "gy",
  },

  {
    name = "  Copy relative path",
    cmd = function()
      api.fs.copy.relative_path(node())
    end,
    rtxt = "Y",
  },

  { name = "separator" },

  {
    name = "  Rename",
    cmd = function()
      api.fs.rename(node())
    end,
    rtxt = "r",
  },

  {
    name = "  Delete",
    hl = "ExRed",
    cmd = function()
      api.fs.remove(node())
    end,
    rtxt = "d",
  },
}

vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()

  vim.cmd.exec('"normal! \\<RightMouse>"')

  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  if vim.bo[buf].ft == "NvimTree" then
    require("menu").open(nvimtree, { mouse = true })
  end
end, {})
