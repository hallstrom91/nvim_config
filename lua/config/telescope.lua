local builtin = require("telescope.builtin")
local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

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
			theme = "dropdown", -- Ivy-layout for grep
		},
		oldfiles = {
			only_cwd = true, -- show only project catalog
		},
        help_tags = {
            theme = "dropdown",
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
    mappings = {
appings = {
      i = {
        -- Lägg till en custom action för git add
        ["<C-a>"] = function(prompt_bufnr)
          local entry = action_state.get_selected_entry()
          local cmd = "git add " .. entry.value
          vim.cmd("!" .. cmd)
          actions.close(prompt_bufnr)
        end,
      },
      n = {
        -- Samma sak i normal mode
        ["<C-a>"] = function(prompt_bufnr)
          local entry = action_state.get_selected_entry()
          local cmd = "git add " .. entry.value
          vim.cmd("!" .. cmd)
          actions.close(prompt_bufnr)
        end,
      },
    },
    }
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("noice")
-- require("telescope").load_extension("themes")
-- vim.keymap.set("n", "<leader>th", ":Telescope themes<CR>", {noremap = true, silent = true, desc = "Theme Switcher"})


-- Keybinding för att öppna Telescope LSP Info

vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Telescope Commands" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope Keymaps" })
vim.keymap.set("n", "<leader>hh", builtin.help_tags, { desc = "Telescope Help Tags" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Telescope Grep Current Word" })
vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Telescope Quickfix" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope recently opened files" })
-- vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Telescope Registers" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope Diagnostics" })

-- Git binds
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope Git Branches" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Telescope Git Commits" })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope Git Status" })
