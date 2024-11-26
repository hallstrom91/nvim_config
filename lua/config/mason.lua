require("mason").setup({
	ui = {
		icons = {
			package_installed = " ",
			package_pending = " ",
			package_uninstalled = " ",
		},
	},
	ensured_installed = { "pip" }, -- for python
})

local mason_registry = require("mason-registry")

-- Verktyg som ska säkerställas installerade
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

-- Funktion för att säkerställa installation
for _, tool in ipairs(tools) do
	local package = mason_registry.get_package(tool)
	if not package:is_installed() then
		package:install()
	end
end
