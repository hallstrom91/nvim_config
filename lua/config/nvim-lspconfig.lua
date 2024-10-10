local lspconfig = require("lspconfig")
local init_capabilities = vim.lsp.protocol.make_client_capabilities()
init_capabilities = require("cmp_nvim_lsp").default_capabilities(init_capabilities)

local lsp_flags = { debounce_text_changes = 150 }
-- List of LSP servers
local servers = {
	-- Typescript & JavaScript
	ts_ls = {
		settings = {
			completions = {
				completeFunctionCalls = true,
			},
			filetypes = { "typescript", "typescriptreact", "tsx", "javascript", "javascriptreact", "jsx" },
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

	--	vim.api.nvim_buf_set_options(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	--	vim.api.nvim_buf_set_options(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")

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
