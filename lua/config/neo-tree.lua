require("neo-tree").setup({
    -- general settings
 close_if_last_window = false,  -- Close if the last window
 popup_border_style = "double", -- values = "rounded", "single", "double"
 enable_git_status = true,
 enable_diagnostics = true,
 -- filesystem
  filesystem = {
      filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true, -- only works on Windows for hidden files/directories
            hide_by_name = {
              -- "node_modules"
   },
   always_show = {
     --  ".gitignored",
   },
   always_show_by_pattern = {
       ".env*",
   },
      }, -- end of filesystem / filtered_items
    follow_current_file = {
      enabled = true,  
      leave_dirs_open = false, -- autoclose folders when moving to another
    },
    use_libuv_file_watcher = true,
    -- end of filesystem config
  },
  -- default menu config
  default_component_configs = {
    indent = {
        indent_size = 2,
      padding = 1,
    },
    -- icons for menu
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
    },
}, -- end of "default_component_configs"

    name = {
                trailing_slash = false,
                use_git_status_colors = true,
                highlight = "NeoTreeFileName",
            },
   -- git status config and symbols
  git_status = {
            symbols = {
              -- Change type
              added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = " " , -- or " ", but this is redundant info if you use git_status_colors on the name
              deleted   = "✖",-- this can only be used in the git_status source
              renamed   = "󰁕",-- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            }
          },
window = {
    position = "right",
    width = 30,
},

-- buffers
buffers = {
    follow_current_file = {
        enabled = true, 
        leave_dirs_open = false,
    },
},

-- EOF
})
