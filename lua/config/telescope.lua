local builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "truncate" },
		file_ignore_patterns = { "node_modules", ".git/" }, -- Ignore unwanted folders
	},
	pickers = {
		find_files = {
			theme = "dropdown", -- narrow layout
		},
		live_grep = {
			theme = "ivy", -- Ivy-layout for grep
		},
		oldfiles = {
			only_cwd = true, -- show only project catalog
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- Activate fuzzy find
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

--pcall(telescope.load_extension, "fzf") -- load fzf ?
require("telescope").load_extension("fzf")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope recently opened files" })
