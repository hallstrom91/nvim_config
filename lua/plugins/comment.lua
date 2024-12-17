return {
	"numToStr/Comment.nvim",
	lazy = true, -- Gör Comment.nvim lazy-laddad
	keys = {
		{ "gc", mode = { "n", "v" }, desc = "Toggle comment (line)" },
		{ "gb", mode = { "n", "v" }, desc = "Toggle comment (block)" },
	},
	config = function()
		require("Comment").setup({
			toggler = {
				line = "gcc", -- comment for one row
				block = "gbb", -- block comment for marked rows
			},
			opleader = {
				line = "gc", -- comment on or several rows
				block = "gb", -- block comment for marked rows
			},
			-- test for tsx/jsx to add {} around comments in *sx part
			pre_hook = function(ctx)
				local U = require("Comment.utils")
				if vim.bo.filetype == "javascriptreact" or vim.bo.filetype == "typescriptreact" then
					local location = nil
					if ctx.ctype == U.ctype.block then
						location = require("ts_context_commentstring.utils").get_cursor_location()
					elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
						location = require("ts_context_commentstring.utils").get_visual_start_location()
					end
					return require("ts_context_commentstring.internal").calculate_commentstring({
						key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
						location = location,
					})
				end
			end,
		})
	end,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "VeryLazy",
	},
}
