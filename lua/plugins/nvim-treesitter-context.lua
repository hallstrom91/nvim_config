return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = "nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("treesitter-context").setup({
			enable = true,
			multiwindow = true,
		})
		--	custom highlight color for context
		vim.api.nvim_set_hl(0, "TreesitterContextBottom", {
			underline = true,
			bg = "#3b3b3b", -- bg
			sp = "#909190", -- underline
		})
		-- custom highlight number color for context
		vim.api.nvim_set_hl(0, "TreesitterContextLineNumberBottom", {
			underline = true,
			bg = "#ffffff", -- bg
			sp = "#67a137", -- underline
		})

		vim.keymap.set("n", "[c", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { silent = true })
	end,
}
