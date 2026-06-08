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
        path = "~/Documents/kuroashi",
      },
    },
    install_commands = true,
  },
}
