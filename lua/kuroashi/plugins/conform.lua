return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "golines", "gofmt" },
				python = { "isort", "black" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
			},
			formatters = {
				prettier = {
					command = "node",
					args = function()
						local data_path = vim.fn.stdpath("data")
						local prettier_js =  data_path .. "\\mason\\packages\\prettier\\node_modules\\prettier\\bin\\prettier.cjs"
						return { prettier_js, "--stdin-filepath", "$FILENAME" }
					end,
				},
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
