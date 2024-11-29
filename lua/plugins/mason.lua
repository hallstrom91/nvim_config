return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- test (update every time)
		config = function()
			--	require("config.mason")
			local mason = require("mason")

			mason.setup({
				ui = {
					icons = {
						package_installed = " ",
						package_pending = " ",
						package_uninstalled = " ",
					},
				},
				ensured_installed = { "pip" }, -- for python
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			--	require("config.mason")
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = {
					-- only LSP servers (auto-install)
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
					"bashls",
					"jsonls",
				},
				automatic_installation = true, -- Install LSP servers
			})
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" },
		lazy = true, -- lazyload
		config = function()
			-- 	require("config.mason")
			local mason_dap = require("mason-nvim-dap")
			mason_dap.setup({
				ensure_installed = { "node2", "python", "chrome", "js-debug-adapter" }, -- add apaters
				automatic_setup = true,
			})

			-- Auto install Linters, Formatters and DAP. !! NOT LSP !!
			local tools = {
				"prettierd", -- Formatter for JavaScript/TypeScript
				"quick-lint-js", -- Linter 3för JavaScript/TypeScript
				"markdownlint-cli2", -- Linter/Formatter for markdown
				"stylua", -- Formatter for Lua
				--	"black", -- Formatter for Python
				--	"flake8", -- Linter for Python
				"shellcheck", -- Linter for Bash
				"shfmt", -- Formatter for Bash
				"js-debug-adapter", -- DAP for js/ts
				"bash-debug-adapter", -- DAP for bash
				"chrome-debug-adapter", -- DAP for chrome
			}

			-- Function to auto install tools at bootup
			local mason_registry = require("mason-registry")

			for _, tool in ipairs(tools) do
				local package = mason_registry.get_package(tool)
				if not package:is_installed() then
					package:install()
				end
			end
		end,
	},
}
