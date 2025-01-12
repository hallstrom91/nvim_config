local builtin = require('telescope.builtin')
local telescope = require('telescope')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

telescope.setup({
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    path_display = { 'truncate' },
    file_ignore_patterns = { 'node_modules', '.git/' }, -- Ignore unwanted folders
  },
  pickers = {
    find_files = {
      theme = 'dropdown', -- narrow layout
    },
    live_grep = {
      theme = 'dropdown', -- Ivy-layout for grep
    },
    oldfiles = {
      only_cwd = true, -- show only project catalog
    },
    help_tags = {
      theme = 'dropdown',
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- Activate fuzzy find
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
  --[[ 	mappings = {
		i = {
			["<C-a>"] = function(prompt_bufnr)
				local entry = action_state.get_selected_entry()
				local cmd = "git add " .. entry.value
				vim.cmd("!" .. cmd)
				actions.close(prompt_bufnr)
			end,
		},
		n = {
			["<C-a>"] = function(prompt_bufnr)
				local entry = action_state.get_selected_entry()
				local cmd = "git add " .. entry.value
				vim.cmd("!" .. cmd)
				actions.close(prompt_bufnr)
			end,
		},
	}, ]]
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('noice')

--[[ vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Telescope Commands" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope Keymaps" })
vim.keymap.set("n", "<leader>hh", builtin.help_tags, { desc = "Telescope Help Tags" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Telescope Grep Current Word" })
vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Telescope Quickfix" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope recently opened files" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope Diagnostics" })
-- vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Telescope Registers" })

-- Git binds
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope Git Branches" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Telescope Git Commits" })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope Git Status" }) ]]

-- Keybinds for telescope
local keymaps = {
  { '<leader>fc', builtin.commands, 'Telescope Commands' },
  { '<leader>fk', builtin.keymaps, 'Telescope Keymaps' },
  { '<leader>hh', builtin.help_tags, 'Telescope Help Tags' },
  { '<leader>ff', builtin.find_files, 'Telescope Find Files' },
  { '<leader>fg', builtin.live_grep, 'Telescope Live Grep' },
  { '<leader>fw', builtin.grep_string, 'Telescope Grep Current Word' },
  { '<leader>fq', builtin.quickfix, 'Telescope Quickfix' },
  { '<leader>fb', builtin.buffers, 'Telescope Buffers' },
  { '<leader>fr', builtin.oldfiles, 'Telescope Recently Opened Files' },
  { '<leader>fd', builtin.diagnostics, 'Telescope Diagnostics' },
  { '<leader>gb', builtin.git_branches, 'Telescope Git Branches' },
  { '<leader>gc', builtin.git_commits, 'Telescope Git Commits' },
  { '<leader>gs', builtin.git_status, 'Telescope Git Status' },
}

for _, map in ipairs(keymaps) do
  vim.keymap.set('n', map[1], map[2], { desc = map[3], noremap = true, silent = true })
end
