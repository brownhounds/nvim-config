local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ""

-- Workaround to get system clipboard working when using nvim over SSH
if os.getenv("SSH_CLIENT") ~= nil or os.getenv("SSH_TTY") ~= nil then
  local function my_paste(_)
    return function(_)
      local content = vim.fn.getreg('"')
      return vim.split(content, "\n")
    end
  end

  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = my_paste("+"),
      ["*"] = my_paste("*"),
    },
  }
end

-- NvimTree
keymap("n", "<leader>b", ":NvimTreeToggle<CR>", opts)

-- ctrl + c with system clipboard
keymap("v", "<C-c>", '"+y', opts)

-- ctrl + shift + v with system clipboard
keymap("v", "<C-S-v>", '"+p', opts)
keymap("n", "<C-S-v>", '"+p', opts)

-- Move Line up and down
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv")

-- Comments
vim.keymap.set("v", "<C-k>", "gc", { remap = true, silent = true })

-- Move around windows
vim.keymap.set("n", "<C-Left>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { silent = true })

-- Git blame line
keymap("n", "<C-g>", ":ToggleBlameLine<CR>", { noremap = true, silent = true })

-- Navigate Tabs
vim.api.nvim_set_keymap("n", "<F11>", ":tabprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F12>", ":tabnext<CR>", { noremap = true, silent = true })

-- View All Keybindings
local config_path = vim.fn.stdpath("config") .. "/keybinds.md"
vim.api.nvim_set_keymap("n", "<leader>k", ":view " .. config_path .. "<CR>", { noremap = true, silent = true })

-- Git Conflict
vim.api.nvim_set_keymap("n", "c-q", ":GitConflictListQf<CR>", { noremap = true, silent = true })

-- Show Lsp Errors In a Float
vim.api.nvim_set_keymap("n", "<F10>", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
