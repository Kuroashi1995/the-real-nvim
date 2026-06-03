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

-- vim.keymap.set("n", "<leader>fc", function()
--   local gs = package.loaded.gitsigns
--   if not gs then return end
--
--   local hunks = gs.get_hunks()
--   if not hunks or vim.tbl_isempty(hunks) then return end
--
--   local format = require("conform").format
--   local last_line_in_buffer = vim.api.nvim_buf_line_count(0)
--
--   -- Iteramos a la inversa para evitar que el cambio de una línea
--   -- afecte los índices de las líneas superiores
--   for i = #hunks, 1, -1 do
--     local hunk = hunks[i]
--     if hunk.type ~= "delete" then
--       local start = hunk.added.start
--       local count = hunk.added.count
--
--       -- Calculamos el final del rango
--       local last = start + (count > 0 and count - 1 or 0)
--
--       -- Validamos que el rango esté dentro de los límites del buffer real
--       -- Esto evita el "Index out of bounds"
--       if start <= last_line_in_buffer then
--         last = math.min(last, last_line_in_buffer)
--
--         format({
--           range = {
--             ["start"] = { start, 0 },
--             ["end"] = { last, 0 },
--           },
--           async = false,
--         })
--       end
--     end
--   end
--
--   vim.notify("Surgical Format Complete")
-- end, { desc = "Format Git Hunks Only" })
--
-- vim.keymap.set({ "n", "v" }, "<leader>fa", function()
--   require("conform").format({
--     lsp_format = "prefer",
--     async = true,
--     timeout_ms = 1000,
--   })
-- end, { desc = "Format active buffer or selection" })
