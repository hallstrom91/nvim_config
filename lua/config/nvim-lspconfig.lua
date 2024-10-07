local lspconfig = require("lspconfig")
local init_capabilities = vim.lsp.protocol.make_client_capabilities()
init_capabilities = require("cmp_nvim_lsp").default_capabilities(init_capabilities)

-- List of LSP servers
local servers = {
	ts_ls = {},
	cssls = {},
	html = {},
	pyright = {},
	lua_ls = {},
	tailwindcss = {},
	marksman = {},
	quick_lint_js = {},
	vimls = {},
	yamlls = {},
	cssmodules_ls = {},
	css_variables = {},
}

-- Loop servers
for server, config in pairs(servers) do
	lspconfig[server].setup(vim.tbl_deep_extend("force", {
		capabilities = init_capabilities,
	}, config))
end

-- typescript, tsx, js & jsx
--lspconfig.ts_ls.setup({})

-- css
--lspconfig.cssls.setup({})

-- html
--lspconfig.html.setup({})

-- python
--lspconfig.pyright.setup({})

--lua
--lspconfig.lua_ls.setup({})

-- tailwindcss
--lspconfig.tailwindcss.setup({})

--marksman
--lspconfig.marksman.setup({})

-- quick lint js
--lspconfig.quick_lint_js.setup({})

-- vim
--lspconfig.vimls.setup({})

-- yaml
--lspconfig.yamlls.setup({})

-- css modules
--lspconfig.cssmodules_ls.setup({})

-- css variables
--lspconfig.css_variables.setup({})
