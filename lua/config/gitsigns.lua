vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00FF00" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FFFF00" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#FF0000" })

require("gitsigns").setup({
	signs = {
		add = { text = "" },
		change = { text = "" },
		delete = { text = "" },
		topdelete = { text = "" },
		changedelete = { text = "" },
		untracked = { text = "󱀶" },
	},
	signs_staged = {
		add = { text = "" },
		change = { text = "" },
		delete = { text = "" },
		topdelete = { text = "" },
		changedelete = { text = "" },
		untracked = { text = "󱀶" },
	},
	signs_staged_enable = true,
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false,
	linehl = false,
	word_diff = false,
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = true,
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
	current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil,
	max_file_length = 40000,
	preview_config = {
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})