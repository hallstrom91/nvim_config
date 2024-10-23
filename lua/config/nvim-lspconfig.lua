local lspconfig = require("lspconfig")
local init_capabilities = vim.lsp.protocol.make_client_capabilities()
init_capabilities = require("cmp_nvim_lsp").default_capabilities(init_capabilities)
local ufo_capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp_flags = { debounce_text_changes = 150 }

ufo_capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

init_capabilities = vim.tbl_deep_extend("keep", init_capabilities, ufo_capabilities)

-- List of LSP servers
local servers = {
	-- Typescript & JavaScript
	ts_ls = {
		settings = {
			cmd = { "typescript-language-server", "--stdio" },
			completions = {
				completeFunctionCalls = true,
			},
			filetypes = { "typescript", "typescriptreact", "tsx", "javascript", "javascriptreact", "jsx", "js" },
		},
	},
	cssls = {}, -- CSS
	html = {}, -- HTML
	pyright = {}, -- Python
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	}, -- Lua
	tailwindcss = {}, -- Tailwindcss
	marksman = {}, -- Markdown (github readme etc)
	quick_lint_js = {}, -- JavaScript Linting
	vimls = {}, -- Vim
	yamlls = {}, -- YAML
	cssmodules_ls = {
		filetypes = {
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"javascript",
			"javascriptreact",
			"javascript.jsx",
		},
		camelCase = true,
	}, -- CSS modules
	css_variables = {}, -- CSS Variables
	bashls = {}, -- Bash (.sh -files)
	jsonls = {
		schemas = {
			{
				fileMatch = { "package.json" },
				url = "https://json.schemastore.org/package.json",
			},
			{
				fileMatch = { "tsconfig*.json" },
				url = "https://json.schemastore.org/tsconfig.json",
			},
			{
				fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
				url = "https://json.schemastore.org/prettierrc.json",
			},
			{
				fileMatch = { ".eslintrc", ".eslintrc.json" },
				url = "https://json.schemastore.org/eslintrc.json",
			},
			{
				fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
				url = "https://json.schemastore.org/babelrc.json",
			},
		},
	},
}

-- deactivate LSP formatting in favor of prettier, stylua, black etc.
local on_attach = function(client, bufnr)
	local exclude_formatting = {
		"ts_ls", -- Use prettier
		"html", -- Use prettier
		"cssls", -- Use prettier
		"luals", -- Use stylua
		"pyright", -- Use isort & black
		"yamlls", -- Use Prettier
		"marksman", -- use Prettier
		"jsonls", -- use Prettier
	}

	if vim.tbl_contains(exclude_formatting, client.name) then
		client.server_capabilities.documentFormattingProvider = false
	end
end

-- Loop servers
for server, config in pairs(servers) do
	lspconfig[server].setup(vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		capabilities = init_capabilities,
		flags = lsp_flags,
	}, config))
end
