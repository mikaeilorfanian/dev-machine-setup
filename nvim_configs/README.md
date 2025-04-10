# How to Set Up
`init.lua` includes only the diff. Use https://github.com/nvim-lua/kickstart.nvim as a starting point.

Move files in `plugins` dir here to your nvim config's `lua/custom/plugins` dir.

Make follwing changes to lua/kickstart/plugins/debug.lua:
```lua
'leoluz/nvim-dap-go',  -- below this line
'mfussenegger/nvim-dap-python',
```

```lua
'delve',  -- below this line
'debugpy',
```

```lua
-- Below golang specific config
-- Install python specific config
require('dap-python').setup 'python3'
```