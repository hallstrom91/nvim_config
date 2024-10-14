require("neo-tree").setup({
	-- General settings
	close_if_last_window = false, -- Close Neo-tree if it's the last window open
	popup_border_style = "double", -- Border style for popups (rounded, single, double)
	enable_git_status = true, -- Enable git status integration
	enable_diagnostics = true, -- Enable diagnostics (e.g., linting info)

	-- Filesystem settings
	filesystem = {
		filtered_items = {
			visible = false, -- Show hidden items with a different style
			hide_dotfiles = false, -- Hide dotfiles by default
			hide_gitignored = true, -- Hide gitignored files
			hide_hidden = true, -- Hide hidden files (on Windows only)
			hide_by_name = { -- Specify items to hide by name
				-- "node_modules"
			},
			always_show = { -- Always show these items
				".gitignored",
				"node_modules",
			},
			always_show_by_pattern = { -- Always show items matching these patterns
				".env*",
			},
		},

		-- Automatically follow the current file
		follow_current_file = {
			enabled = true, -- Follow the currently active file
			leave_dirs_open = false, -- Close directories when navigating away
		},

		use_libuv_file_watcher = true, -- Automatically refresh Neo-tree when files are created/removed
	}, -- End of filesystem settings

	-- Default UI settings
	default_component_configs = {
		indent = {
			indent_size = 2, -- Set the indent size for items in the tree
			padding = 1, -- Padding around items
		},
		icon = {
			folder_closed = "", -- Icon for closed folders
			folder_open = "", -- Icon for open folders
			folder_empty = "", -- Icon for empty folders
		},
	}, -- End of default component configs

	-- File name settings
	name = {
		trailing_slash = false, -- Show trailing slash after folder names
		use_git_status_colors = true, -- Color file names based on git status
		highlight = "NeoTreeFileName", -- Highlight group for file names
	},

	-- Git status settings
	git_status = {
		symbols = {
			-- Change type
			added = "✚", -- Symbol for added files
			modified = "", -- Symbol for modified files
			deleted = "✖", -- Symbol for deleted files
			renamed = "󰁕", -- Symbol for renamed files
			-- Status type
			untracked = "", -- Symbol for untracked files
			ignored = "", -- Symbol for ignored files
			unstaged = "󰄱", -- Symbol for unstaged changes
			staged = "", -- Symbol for staged changes
			conflict = "", -- Symbol for merge conflicts
		},
	},

	-- Neo-tree window settings
	window = {
		position = "right", -- Position Neo-tree on the right side of the screen
		width = 30, -- Set the width of the Neo-tree window
	},

	-- Buffer management settings
	buffers = {
		follow_current_file = {
			enabled = true, -- Follow the currently active buffer
			leave_dirs_open = false, -- Close directories when switching buffers
		},
	},

	-- Additional custom mappings
	mappings = {
		["a"] = "add", -- Press 'a' to add new file or folder
		["C"] = "create", -- Press 'C' to create a new file/folder
		["<C-n>"] = "create", -- Ctrl+n to create a new file or folder
	},
}) -- End of Neo-tree setup
