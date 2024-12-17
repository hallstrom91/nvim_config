return {
	"windwp/nvim-ts-autotag",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = "InsertEnter",
	config = function()
		require("nvim-ts-autotag").setup({
			enable = true,
			filetype = { "html", "xml", "javascript", "typescript", "typescriptreact", "javascriptreact" },
			opts = {
				enable_close = true,
				enable_rename = false,
				enable_close_on_slash = true,
			},
		})
	end,
}
