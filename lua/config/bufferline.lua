local map = vim.keymap.set
local lsp_actions = require('modules.diagnostics.lsp_actions')
require('bufferline').setup({
  options = {
    mode = 'buffers', -- show buffers instead of tabs
    -- style_preset = require('bufferline').style_preset.default,
    themable = true,
    numbers = 'ordinal', -- (can be "none", "ordinal", "buffer_id", or "both")
    diagnostics = 'nvim_lsp',
    diagnostics_update_on_event = true,
    close_command = 'bdelete! %d',
    right_mouse_command = 'bdelete! %d', -- close buffer with right-click
    left_mouse_command = 'buffer %d', -- switch to buffer with left-click
    middle_mouse_command = nil, -- no action on middle-click
    --color_icons = true,
    diagnostics_indicator = lsp_actions.diagnostics_indicator,
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'File Explorer',
        --[[   text = function()
          local cwd = vim.fn.getcwd()
          return cwd .. 'File Explorer'
        end, ]]
        highlight = 'Directory',
        --separator =
      },
    },
    hover = {
      enabled = true,
      delay = 200, -- value in ms
      reveal = { 'close' },
    },

    -- Indicator for the active buffer
    indicator = {
      icon = '▎󰸞 ', -- indicator for active buffer
      style = 'icon', -- can be 'icon', 'underline', or 'none'
    },

    -- Icons for closing and modified buffers
    buffer_close_icon = '󰅖', -- icon for closing buffers
    modified_icon = '󰷫', -- icon for modified buffers
    close_icon = '', -- icon for completely closing the bufferline (when relevant)
    left_trunc_marker = '', -- icon to indicate more buffers to the left
    right_trunc_marker = '', -- icon to indicate more buffers to the right

    -- Other options
    show_buffer_close_icons = true, -- show close icon on each buffer
    show_tab_indicators = true, -- show indicators for active tabs
    persist_buffer_sort = true, -- maintain buffer sorting between sessions
    separator_style = 'thick', -- options: "slant", "thick", "thin", etc.
    enforce_regular_tabs = false, -- prevent irregular tabs
    always_show_bufferline = true, -- always show bufferline even with one buffer open
  },
})

map('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = 'Next buffer' })
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { desc = 'Prev buffer' })
