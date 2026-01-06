return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	settings = {
		gopls = {
			buildFlags = { "-tags=tinygo" },
		},
	},
}

