## Wezterm Terminal

Config goes to: `~/.wezterm.lua` -> both windows and unix like

```lua
local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Afterglow'

-- Windows specific only
config.default_prog = { 'powershell.exe' }

config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 14
config.line_height = 1.25

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
```

## Git Config

```bash
git config --global core.editor "nvim"
git config --global sequence.editor "nvim"
```

## Hyper-V mount a drive over sshfs

- install sshfs over choco
- mount a network drive: `\\sshfs\user@host`

## Conflict diff view like vscode
- https://github.com/akinsho/git-conflict.nvim

