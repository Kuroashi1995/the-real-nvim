require('gitsigns').setup({
  -- These signs stay in the "gutter" (left of line numbers)
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  -- This ensures it doesn't try to take over Fugitive's job
  attach_to_untracked = true,
  current_line_blame = false, -- Turn off if you don't want "who did this" text everywhere
})
