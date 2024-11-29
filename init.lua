-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Load my default settings for nvim
vim.o.number = true -- Show line numbers
vim.o.relativenumber = false -- Relative line numbers (very annoying)
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = 4 -- Indentation width
vim.o.tabstop = 4 -- Tab width
vim.o.termguicolors = true -- Enable true colors
vim.o.splitbelow = false -- Open windows horizontal
vim.o.splitright = true -- Open windows vertical
vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1 -- disable netrw
vim.o.foldenable = true -- enable folding
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldcolumn = "1"
vim.opt.clipboard = "unnamedplus" -- sync clipboard actions with system clipboard
--vim.o.foldmethod = "expr"
--vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- Disable providers
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Load mappings
local mappings_path = vim.fn.stdpath("config") .. "/lua/mappings.lua"
--local mappings_loaded = false
if vim.fn.filereadable(mappings_path) == 1 then
	dofile(mappings_path)
--	mappings_loaded = true
else
	vim.api.nvim_echo({ { "mappings.lua file not found", "WarningMsg" } }, true, {})
end

-- Load autocmds
local autocmds_path = vim.fn.stdpath("config") .. "/lua/autocmds.lua"
--local autocmds_loaded = false
if vim.fn.filereadable(autocmds_path) == 1 then
	dofile(autocmds_path)
	--autocmds_loaded = true
else
	vim.api.nvim_echo({ { "autocmds.lua file not found", "WarningMsg" } }, true, {})
end

require("config.lazy")
