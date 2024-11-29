return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("config.nvim-lspconfig")
	end,
}
