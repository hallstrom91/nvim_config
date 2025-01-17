local M = {}
local colors = require('modules.ui.colors').vsc_dark_modern

M.lsp_progress = {
  function()
    return require('lsp-progress').progress({
      format = function(messages)
        local active_clients = vim.lsp.get_clients()
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

function M.open_diagnostics_with_telescope()
  vim.diagnostic.setqflist({ open = false }) -- add diagnostic but dont open qflist

  local quickfix_items = vim.fn.getqflist()
  if #quickfix_items > 0 then
    --  require('telescope.builtin').quickfix() -- Open Telescope Quickfix
    require('telescope.builtin').diagnostics() -- Open Telescope Diagnostics
  else
    print('Nothing to fix silly human!')
  end
end
return M
