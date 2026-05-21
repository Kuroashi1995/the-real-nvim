return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  lazy = false,
  clone = {
    shallow = true,
  },
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = "kuroashi",
        path = "C:/Users/Andrew Halley/Documents/kuroashi/Work/Mango",
      },
    },
    install_commands = true,
  },
}
