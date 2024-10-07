require("mason-lspconfig").setup({
	ensure_installed = {
		-- only LSP servers
		"ts_ls",
		"html",
		"cssls",
		"pyright",
		"lua_ls",
		"tailwindcss",
		"marksman",
		"quick_lint_js",
		"vimls",
		"yamlls",
		"cssmodules_ls",
		"css_variables",
	},
})
