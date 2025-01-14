local colors = require('modules.colors').vsc_dark_modern
local neovim_logo = require('modules.colors').neovim_logo

vim.api.nvim_set_hl(0, 'NeovimDarkLeaf', { fg = neovim_logo.dark_leaf, bg = nil, bold = false })
vim.api.nvim_set_hl(0, 'NeovimLeaf', { fg = neovim_logo.leaf, bg = nil, bold = false })
vim.api.nvim_set_hl(0, 'NeovimDustyTeal', { fg = neovim_logo.dusty_teal, bg = nil, bold = false })
vim.api.nvim_set_hl(0, 'NeovimLightSky', { fg = neovim_logo.light_sky, bg = nil, bold = true })
vim.api.nvim_set_hl(0, 'NeovimSky', { fg = neovim_logo.sky, bg = nil, bold = true })
vim.api.nvim_set_hl(0, 'NeovimDarkSky', { fg = neovim_logo.dark_sky, bg = nil, bold = true })
vim.api.nvim_set_hl(0, 'NeovimIcon', { fg = neovim_logo.icon, bg = nil, bold = false })
vim.api.nvim_set_hl(0, 'NeovimText', { fg = neovim_logo.text, bg = nil, bold = true })
vim.api.nvim_set_hl(0, 'NeovimNumber', { fg = neovim_logo.number, bg = nil, bold = true })

local status_components = {}
status_components.nvim_logo_and_version = {
  function()
    return ' neovim v' .. vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch
  end,
  cond = function()
    return vim.v.hlsearch == 0 and not vim.fn.mode():match('[vV]')
  end,
  color = {
    fg = colors.fg,
    bg = colors.bg_local,
    gui = 'bold',
  },
}

status_components.nvim_logo_and_version_color = {
  function()
    local n = '%#NeovimDarkLeaf#n'
    local e = '%#NeovimLeaf#e'
    local o = '%#NeovimDustyTeal#o'
    local v = '%#NeovimLightSky#v'
    local i = '%#NeovimSky#i'
    local m = '%#NeovimDarkSky#m'

    local version_major = '%#NeovimNumber#' .. vim.version().major
    local version_minor = '%#NeovimNumber#' .. vim.version().minor
    local version_patch = '%#NeovimNumber#' .. vim.version().patch

    local logo = '%#NeoVimIcon# '
    local version = '%#NeovimText#' .. ' v' .. version_major .. '.' .. version_minor .. '.' .. version_patch
    return logo .. n .. e .. o .. v .. i .. m .. version
  end,
  cond = function()
    return vim.v.hlsearch == 0 and not vim.fn.mode():match('[vV]')
  end,
}

status_components.nvim_logo = {
  function()
    return ' neovim'
  end,
  cond = function()
    return vim.v.hlsearch == 0 and not vim.fn.mode():match('[vV]')
  end,
  color = {
    fg = colors.fg,
    bg = colors.bg,
    gui = 'bold',
  },
}

status_components.nvim_version = {
  function()
    return ' ' .. vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch
  end,
  color = {
    fg = colors.bg_local,
    bg = colors.bg,
    gui = 'italic',
  },
}

status_components.clock = {
  function()
    return os.date('%H:%M:%S') -- (24-hour format)
  end,
  icon = ' ',
  color = {
    fg = colors.fg,
    bg = colors.darkblue,
    gui = 'bold',
  },
}

status_components.lsp_progress = {
  function()
    return require('lsp-progress').progress({
      format = function(messages)
        local active_clients = vim.lsp.get_clients() -- TODO: fix this!
        local client_count = #active_clients
        if #messages > 0 then
          return ' LSP: ' .. client_count .. ' ' .. table.concat(messages, ' ')
        end
        if #active_clients <= 0 then
          return ' LSP: ' .. client_count
        else
          local client_names = {}
          for _, client in ipairs(active_clients) do
            if client and client.name ~= '' then
              table.insert(client_names, '[' .. client.name .. ']')
            end
          end
          return ' LSP: ' .. client_count .. ' ' .. table.concat(client_names, ' ')
        end
      end,
    })
  end,
  color = {
    fg = colors.fg,
    bg = colors.bg,
  },
}

function status_components.open_diagnostics_with_telescope()
  vim.diagnostic.setqflist({ open = false }) -- add diagnostic but dont open qflist

  local quickfix_items = vim.fn.getqflist()
  if #quickfix_items > 0 then
    --  require('telescope.builtin').quickfix() -- Open Telescope Quickfix
    require('telescope.builtin').diagnostics() -- Open Telescope Diagnostics
  else
    print('Nothing to fix silly human!')
  end
end

return status_components
