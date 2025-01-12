local status = require('modules.status')
local colors = require('modules.colors').vsc_dark_modern
local custom_theme = require('modules.themes').vsc_dark_lualine
local utils = require('modules.utils')

local nvim_logo_and_version = status.nvim_logo_and_version
local nvim_logo_and_version_color = status.nvim_logo_and_version_color
local clock = status.clock
local lsp_progress = status.lsp_progress
local open_diagnostics_with_telescope = status.open_diagnostics_with_telescope

local left_separator = utils.left_separator_lualine
local right_separator = utils.right_separator_lualine

-- icons for current mode
local mode_icons = {
  NORMAL = ' ',
  INSERT = '󱓥 ',
  VISUAL = '󱘣 ',
  REPLACE = '󰛈 ',
  COMMAND = ' ',
}

-- get the current mode
local function mode_with_icon()
  local current_mode = vim.fn.mode():sub(1, 1)
  local mode_map = {
    n = 'NORMAL',
    i = 'INSERT',
    v = 'VISUAL',
    R = 'REPLACE',
    c = 'COMMAND',
  }
  local mode_name = mode_map[current_mode] or 'NORMAL'
  return mode_icons[mode_name] .. mode_name
end

-- LSP diagnostics
local lsp_diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbol = { error = '  ', warn = ' ', info = ' ', hint = ' ' },
  color = {
    error = colors.red,
    warn = colors.yellow,
    info = colors.blue,
    hint = colors.cyan,
  },
  on_click = function()
    open_diagnostics_with_telescope()
  end,
}

require('lualine').setup({

  options = {
    theme = custom_theme,
    --	component_separators = { left = "", right = "" },
    --	component_separators = {left = '', right = ''}
    --	section_separators = { left = "", right = "" },
    --	component_separators = { left = "󰇙", right = "󰇙" },
    component_separators = '',
    section_separators = { left = ' ', right = ' ' },
    always_divide_middle = true,
    disabled_filetypes = {
      statusline = { 'neo-tree', 'git', 'fugitive', 'trouble', 'dashboard' },
      winbar = { 'neo-tree', 'DiffviewFiles', 'git', 'dashboard' },
    },
  },

  sections = {

    lualine_a = {
      {
        mode_with_icon,
        padding = { left = 1, right = 1 },
      },
    },
    lualine_b = {
      {
        'filename',
        file_status = true,
        newfile_status = true,
        path = 0, -- 1 =  filename, 2: filename with path, 3: full path
        color = {
          bg = colors.visual_color,
          gui = 'italic',
        },
      },
      { 'location', color = { bg = colors.visual_color } },
      left_separator(colors.visual_color),
    },

    lualine_c = {
      {
        'branch',
        icon = ' ',
        color = {
          fg = colors.cyan,
          gui = 'bold',
        },
      },
      {
        'diff',
        symbols = {
          added = '✚ ',
          modified = '✎ ',
          removed = '✖ ',
          color_added = colors.green,
          color_modified = colors.orange,
          color_removed = colors.red,
        },
        color = { gui = 'italic' },
      },
    },

    lualine_x = {
      { 'selectioncount' },
      { 'searchcount' },
      -- nvim_logo_and_version,
      nvim_logo_and_version_color,
    },

    lualine_y = {
      lsp_progress,
      right_separator(colors.bg_local),
      { 'filetype', color = { bg = colors.bg_local } },
      lsp_diagnostics,
    },

    lualine_z = {
      clock,
    },
  },

  inactive_sections = {
    -- to remove defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
})

vim.api.nvim_create_augroup('lualine_augroup', { clear = true })
vim.api.nvim_create_autocmd('User', {
  group = 'lualine_augroup',
  pattern = 'LspProgressStatusUpdated',
  callback = require('lualine').refresh,
})
