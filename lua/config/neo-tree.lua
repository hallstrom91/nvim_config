vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local events = require("neo-tree.events")

require("neo-tree").setup({
	-- General settings
	close_if_last_window = false, -- Close Neo-tree if it's the last window open
	popup_border_style = "rounded", -- Border style for popups (rounded, single, double)
	enable_git_status = true, -- Enable git status integration
	enable_diagnostics = true, -- Enable diagnostics (e.g., linting info)

	-- Default UI settings
	default_component_configs = {
		container = {
			enable_character_fade = true,
		},
		indent = {
			indent_size = 2, -- Set the indent size for items in the tree
			padding = 1, -- Padding around items
			-- indent guides
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			-- expander config, needed for nesting files
			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "", -- Icon for closed folders
			folder_open = "", -- Icon for open folders
			folder_empty = "", -- Icon for empty folders
			provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
				if node.type == "file" or node.type == "terminal" then
					local success, web_devicons = pcall(require, "nvim-web-devicons")
					local name = node.type == "terminal" and "terminal" or node.name
					if success then
						local devicon, hl = web_devicons.get_icon(name)
						icon.text = devicon or icon.text
						icon.highlight = hl or icon.highlight
					end
				end
			end,
			default = "*",
			highlight = "NeoTreeFileIcon",
		},

		--    Git status settings
		git_status = {
			symbols = {
				-- Change type
				added = "✚", -- Symbol for added files
				modified = "", -- Symbol for modified files
				deleted = "✖", -- Symbol for deleted files
				renamed = "󰁕", -- Symbol for renamed files
				-- Statustype
				untracked = "", -- Symbol for untracked files
				ignored = "", -- Symbol for ignored files
				unstaged = "󰄱", -- Symbol for unstaged changes
				staged = "", -- Symbol for staged changes
				conflict = "", -- Symbol for merge conflicts
			},
		},
		--		    File name settings
		name = {
			trailing_slash = false, -- Show trailing slash after folder names
			use_git_status_colors = true, -- Color file names based on git status
			highlight = "NeoTreeFileName", -- Highlight group for file names
		},
	}, -- End of default component configs

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
				"*.log",
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
		use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
	}, -- End of filesystem settings

	-- Neo-tree window settings
	window = {
		position = "left", -- Position Neo-tree on the right side of the screen
		width = 35, -- Set the width of the Neo-tree window
		-- git commands from fileexplorer menu!
		mappings = {
			["<leader>"] = {
				"toggle_node",
				nowait = false,
			},
			["ga"] = "git_add_file",
			["gu"] = "git_unstage_file",
			-- git delete file
			--[[ 	["gd"] = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()

				vim.ui.input({
					prompt = "Are you sure you want to remove " .. path .. "? [y/N]: ",
				}, function(input)
					if input and input:lower() == "y" then
						-- run `git rm` command
						local Job = require("plenary.job")
						Job:new({
							command = "git",
							args = { "rm", path },
							on_exit = function(_, return_val)
								if return_val == 0 then
									print("Removed: " .. path)
									-- refresh neotree after removal
									events.fire_event(events.GIT_EVENT)
								else
									print("Failed to remove: " .. path)
								end
							end,
						}):start()
					else
						print("File removal cancelled.")
					end
				end)
			end, ]]

			-- git delete file and make automatic commit for deleted file
			["gd"] = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()

				vim.ui.input({
					prompt = "Are you sure you want to remove " .. path .. "? [y/N]: ",
				}, function(input)
					if input and input:lower() == "y" then
						local filename = vim.fn.fnamemodify(path, ":t")
						-- Kör `git rm`
						local Job = require("plenary.job")
						Job:new({
							command = "git",
							args = { "rm", path },
							on_exit = function(_, return_val)
								if return_val == 0 then
									print("Removed: " .. path)

									-- Skapa commit-meddelande automatiskt
									local msg = filename .. " has been terminated by " .. os.getenv("USER")

									-- Kör `git commit -m`
									Job:new({
										command = "git",
										args = { "commit", "-m", msg },
										on_exit = function(_, commit_val)
											if commit_val == 0 then
												print("Commit successful! Message: " .. msg)
												-- Uppdatera Neo-tree efter commit
												events.fire_event(events.GIT_EVENT)
											else
												print("Commit failed.")
											end
										end,
									}):start()
								else
									print("Failed to remove: " .. path)
								end
							end,
						}):start()
					else
						print("File removal cancelled.")
					end
				end)
			end,
			-- git restore file
			["gr"] = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()

				vim.ui.input({
					prompt = "Are you sure you want to restore " .. path .. "? [y/N]: ",
				}, function(input)
					if input and input:lower() == "y" then
						-- Run `git restore` command
						local Job = require("plenary.job")
						Job:new({
							command = "git",
							args = { "restore", path },
							on_exit = function(_, return_val)
								if return_val == 0 then
									print("Restored to last commit: " .. path)
									-- refresh neotree after restore
									events.fire_event(events.GIT_EVENT)
								else
									print("Failed to restore: " .. path)
								end
							end,
						}):start()
					else
						print("File restore cancelled.")
					end
				end)
			end,
			-- git commit file/files and add commit message
			["gz"] = function(state)
				-- Öppna en inputruta för commit-meddelandet
				vim.ui.input({ prompt = "Enter commit message: " }, function(msg)
					if not msg or msg == "" then
						print("Commit cancelled.")
						return
					end

					-- Kör `git commit -m` med det angivna meddelandet
					local Job = require("plenary.job")
					Job:new({
						command = "git",
						args = { "commit", "-m", msg },
						cwd = state.path, -- Sätter arbetskatalogen till den aktuella sökvägen
						on_exit = function(_, return_val)
							if return_val == 0 then
								print("Commit successful! Message: " .. msg)
								-- Uppdatera Neo-tree automatiskt efter commiten
								events.fire_event(events.GIT_EVENT)
							else
								print("Commit failed.")
							end
						end,
					}):start()
				end)
			end,
		},
	}, -- End of window settings

	-- Buffer management settings
	buffers = {
		follow_current_file = {
			enabled = true, -- Follow the currently active buffer
			leave_dirs_open = false, -- Close directories when switching buffers
		},
	}, -- End of Buffer management
	event_handlers = {

		{
			event = "file_open_requested",
			handler = function()
				-- auto close
				-- vim.cmd("Neotree close")
				-- OR
				require("neo-tree.command").execute({ action = "close" })
			end,
		},
	},
})

-- Ctrl + n: Toggle Neo-tree file explorer
map("n", "<C-n>", ":Neotree toggle reveal_force_cwd=true<CR>", opts)
--
map("n", "<Leader>e", ":Neotree toggle focus<CR>", { desc = "Focus Neo-tree" })
