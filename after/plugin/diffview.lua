vim.keymap.set("n", "<leader>gd", function()
	vim.ui.input({prompt = "Diffview against: "}, function(input)
		if input and input ~= "" then
			vim.cmd("DiffviewOpen " .. input)
		else
			print("Cancelled or empty input")
		end
	end)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gdc", ":DiffviewClose<CR>", { noremap = true, silent = true})
