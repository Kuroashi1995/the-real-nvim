require("conform").setup({
  formatters = {
    prettier = {
      -- Use the Junction to stay space-free
      command = [[C:\nvim-mason\bin\prettier.cmd]],
      -- This is the "magic" line. It tells Conform: 
      -- "Use all your default Prettier range logic, just use my path."
      inherit = true,
    },
  },
  formatters_by_ft = {
    typescript = { "prettier" },
    javascript = { "prettier" },
    typescriptreact = { "prettier" },
  },
})

vim.keymap.set("n", "<leader>fc", function()
  local gs = package.loaded.gitsigns
  local hunks = gs and gs.get_hunks()
  if not (hunks and #hunks > 0) then return end

  local bufnr = vim.api.nvim_get_current_buf()
  local original_text = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n")

  -- 1. Format the full file in the background (using Conform)
  -- We use a callback to handle the result after Prettier finishes
  require("conform").format({
    formatters = { "prettier" },
    async = false, -- Synchronous is safer for this 'snapshot' logic
  })

  local formatted_lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local formatted_text = table.concat(formatted_lines, "\n")

  -- 2. Restore the original buffer immediately 
  -- (We only formatted to see what Prettier WOULD do)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.split(original_text, "\n"))

  -- 3. Calculate the Diff (Unified format)
  -- This gives us 'hunks' of formatting changes
  local diff = vim.diff(original_text, formatted_text, { result_type = "indices" })

  -- 4. Apply only the diff hunks that overlap with Git Hunks
  -- We apply from bottom to top so line indices remain valid during execution
  for i = #diff, 1, -1 do
    local d = diff[i]
    local start_orig, count_orig, start_fmt, count_fmt = d[1], d[2], d[3], d[4]

    local should_apply = false
    for _, ghunk in ipairs(hunks) do
      -- Check if the Prettier change overlaps with a Git change
      if start_orig <= (ghunk.added.start + ghunk.added.count) and 
         (start_orig + count_orig) >= ghunk.added.start then
        should_apply = true
        break
      end
    end

    if should_apply then
      -- Extract the correctly formatted lines from our 'formatted_lines' snapshot
      local new_lines = {}
      for j = 1, count_fmt do
        table.insert(new_lines, formatted_lines[start_fmt + j - 1])
      end
      
      -- Surgically replace only this section
      -- Note: nvim_buf_set_lines is 0-indexed, start_orig is 1-indexed
      vim.api.nvim_buf_set_lines(bufnr, start_orig - 1, start_orig - 1 + count_orig, false, new_lines)
    end
  end

  vim.notify("Surgical Format Complete: Hunks Only")
end, { desc = "Diff-Aware Hunk Format" })
