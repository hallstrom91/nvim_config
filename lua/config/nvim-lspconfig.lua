local lspconfig = require("lspconfig")
local init_capabilities = vim.lsp.protocol.make_client_capabilities()
init_capabilities = require("cmp_nvim_lsp").default_capabilities(init_capabilities)

-- List of LSP servers
local servers = {
	ts_ls = {}, -- Typescript & JavaScript
	cssls = {}, -- CSS
	html = {}, -- HTML
	pyright = {}, -- Python
	lua_ls = {}, -- Lua
	tailwindcss = {}, -- Tailwindcss
	marksman = {}, -- Markdown (github readme etc)
	quick_lint_js = {}, -- JavaScript Linting
	vimls = {}, -- Vim
	yamlls = {}, -- YAML
	cssmodules_ls = {}, -- CSS modules
	css_variables = {}, -- CSS Variables
	bashls = {}, -- Bash (.sh -files)
}

-- deactivate LSP formatting in favor of prettier, stylua, black etc.
local on_attach = function(client, bufnr)
	local exclude_formatting = {
		"ts_ls", -- Use prettier JS/TSUpdate
		"html", -- Use prettier
		"cssls", -- Use prettier
		"luals", -- Use stylua
		"pyright", -- Use isort & black
		"yamlls", -- Use Prettier
	}

	if vim.tbl_contains(exclude_formatting, client.name) then
		client.server_capabilities.documentFormattingProvider = false
	end
end

-- local on_attach = function(client, bufnr)
-- specific what servers to deactivate LSP formatter
--	if client.name == "ts_ls" or client.name == "html" or client.name == "cssls" then
--		client.server_capabilities.documentFormattingProvider = false
--	end
-- end

-- Loop servers
for server, config in pairs(servers) do
	lspconfig[server].setup(vim.tbl_deep_extend("force", {
		on_attach = on_attach,
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
