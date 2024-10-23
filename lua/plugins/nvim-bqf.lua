return {
	"kevinhwang91/nvim-bqf",
	ft = "qf",
	cmd = { "Copen", "Cclose", "Cnext", "Cprevious", "Cgetexpr" },
	config = function()
		require("bqf").setup({
			auto_enable = true,
			auto_resize_height = true,
			preview = {
				win_height = 12,
				win_vheight = 12,
				delay_syntax = 80,
				border_chars = { "│", "│", "─", "─", "╭", "╮", "╯", "╰" }, -- Anpassa kantlinjer
			},
			func_map = {
				open = "<CR>", -- Använd Enter för att öppna poster i QuickFix
				drop = "o",
				tabdrop = "t",
				split = "<C-s>",
				vsplit = "<C-v>",
				stoggleup = "<C-k>",
				stoggledown = "<C-j>",
			},
		})
	end,
}
