local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

-- LSP Capabilities
local init_capabilities = vim.lsp.protocol.make_client_capabilities()
local ufo_capabilities = vim.lsp.protocol.make_client_capabilities()

-- CMP & UFO
init_capabilities = require("cmp_nvim_lsp").default_capabilities(init_capabilities)
ufo_capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
init_capabilities = vim.tbl_deep_extend("keep", init_capabilities, ufo_capabilities)

-- LSP Flags
local lsp_flags = { debounce_text_changes = 150 }

-- List of LSP servers - Manual start required
local manual_servers = {
	"tailwindcss",
	"css_variables",
}

-- List of LSP servers - Auto start @ correct filetype
local servers = {
	-- Typescript & JavaScript
	ts_ls = {
		root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
		settings = {
			cmd = { "typescript-language-server", "--stdio" },
			completions = {
				completeFunctionCalls = false,
			},
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
		},
	},
	-- CSS
	cssls = {
		filetypes = {
			"css",
			"scss",
			"less",
		},
	},
	-- HTML
	html = { filetypes = { "html" } },
	-- Python
	pyright = { filetypes = { "python" } },
	-- Lua
	--[[ 	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
				diagnostics = {
					globals = { "vim" },
                    -- disable = {"undefined-field"}, 
				},
				workspace = {
					library = {
                        -- vim.env.VIMRUNTIME,
						[vim.fn.stdpath("config") .. "/lua"] = true,
						[vim.fn.stdpath("data") .. "/lazy"] = true,
					},
					maxPreload = 200,
					preloadFileSize = 500,
                    checkThirdParty = false,
				},
				telemetry = { enable = false },
				completion = { enable = true, callSnippet = "Replace" },
			},
		},
		filetypes = { "lua" },
	}, ]]

	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
		filetypes = { "lua" },
	},
	-- Markdown (github readme etc)
	marksman = {
		filetypes = { "markdown" },
	},
	-- JavaScript Linting
	quick_lint_js = {
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescriptreact",
			"typescript",
		},
	},
	-- Vim
	vimls = {
		filetypes = {
			"vim",
		},
	},
	-- YAML
	yamlls = {
		filetypes = { "yaml", "yml" },
	},
	-- CSS modules
	cssmodules_ls = {
		filetypes = {
			--	"typescript",
			--	"typescriptreact",
			--	"typescript.tsx",
			"javascript",
			"javascriptreact",
			"javascript.jsx",
		},
		camelCase = true,
	},

	-- Bash (.sh -files)
	bashls = {
		filetypes = { "sh", "bash" },
	},
	-- JSON
	jsonls = {
		filetypes = { "json" },
	},
}

-- deactivate LSP formatting in favor of prettier, stylua, black etc.
local on_attach = function(client, bufnr)
	-- Use prettier instead of LSP formatter for this lsp servers
	local exclude_formatting = {
		"ts_ls",
		"html",
		"cssls",
		"luals",
		"pyright",
		"yamlls",
		"marksman",
		"jsonls",
	}

	if vim.tbl_contains(exclude_formatting, client.name) then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.document_range_formatting = false
	end
end

-- Auto start LSP servers
for server, config in pairs(servers) do
	lspconfig[server].setup(vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		capabilities = init_capabilities,
		flags = lsp_flags,
	}, config))
end

-- Manual start for specific LSP server
vim.api.nvim_create_user_command("StartLsp", function(opts)
	local server_name = opts.args
	if lspconfig[server_name] then
		lspconfig[server_name].setup({
			on_attach = on_attach,
			capabilities = init_capabilities,
			flags = lsp_flags,
		})
		print("Started LSP server for " .. server_name)
	else
		print("LSP server " .. server_name .. " is not configured.")
	end
end, {
	nargs = 1,
	complete = function()
		return manual_servers
	end,
})

-- Restart All LSP servers and CMP
vim.api.nvim_create_user_command("RestartLsp", function()
	vim.cmd("LspStop")
	vim.cmd("LspStart")
	require("cmp").setup()
	print("All LSP servers and CMP restarted!")
end, {})