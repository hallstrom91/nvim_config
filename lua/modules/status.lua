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
        local active_clients = vim.lsp.get_active_clients() -- TODO: fix this!
        local client_count = #active_clients
        if #messages > 0 then
          return ' LSP: ' .. client_count .. ' ' .. table.concat(messages, ' ')
        end
        if #active_clients <= 0 then
          return ' LSP: ' .. client_count
        else
          local client_names = {}
          for i, client in ipairs(active_clients) do
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

-- Funktion för att öppna diagnostik med Telescope Quickfix
--[[ function status_components.open_diagnostics_with_telescope()
  local diagnostics = vim.diagnostic.get(0)
  if #diagnostics == 1 then
    vim.diagnostic.setqflist() -- Lägg till diagnostik i Quickfix-listan
    require('telescope.builtin').quickfix() -- Öppna Telescope Quickfix
  end
end ]]

function status_components.open_diagnostics_with_telescope()
  vim.diagnostic.setqflist({ open = false }) -- add diagnostic but dont open qflist

  local quickfix_items = vim.fn.getqflist()
  if #quickfix_items > 0 then
    require('telescope.builtin').quickfix() -- Öppna Telescope Quickfix
  else
    print('Nothing to fix silly human!')
  end
end

-- Funktion för att öppna diagnostik med Trouble
--[[ function status_components.open_diagnostics_with_trouble()
  local trouble = require('trouble')
  if trouble.is_open() then
    trouble.close() -- Stäng Trouble om det redan är öppet
  else
    trouble.open('lsp_document_diagnostics') -- Öppna diagnostik för det aktuella dokumentet
  end
end
 ]]

--[[ function status_components.jump_to_diagnostic_or_open_qflist()
	local diagnostics = vim.diagnostic.get(0)
	if #diagnostics == 0 then
		vim.diagnostic.setqflist()
		return
	end

	if #diagnostics == 1 then
		local diag = diagnostics[1]
		vim.api.nvim_win_set_cursor(0, { diag.lnum + 1, diag.col })
		return
	end

	vim.diagnostic.setqflist()
end ]]

return status_components
