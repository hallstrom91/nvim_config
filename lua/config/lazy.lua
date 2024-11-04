-----------------------
-- Bootstrap lazy.nvim
------------------------
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

------------------------
-- Load mappings
------------------------
local mappings_path = vim.fn.stdpath("config") .. "/lua/mappings.lua"
local mappings_exists = vim.fn.filereadable(mappings_path)

if mappings_exists == 1 then
	dofile(mappings_path)
else
	vim.api.nvim_echo({ { "mappings.lua file not found", "WarningMsg" } }, true, {})
end

------------------------
-- Load autocmds
------------------------
local autocmds_path = vim.fn.stdpath("config") .. "/lua/autocmds.lua"
local autocmds_exists = vim.fn.filereadable(autocmds_path)

if autocmds_exists == 1 then
	dofile(autocmds_path)
else
	vim.api.nvim_echo({ { "autocmds.lua file not found", "WarningMsg" } }, true, {})
end

------------------------
-- Load default settings
------------------------
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
--vim.o.foldmethod = "expr"
--vim.o.foldexpr = "nvim_treesitter#foldexpr()"
------------------------
-- Disable providers
------------------------
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

------------------------
-- Setup lazy.nvim
------------------------
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
	opts = {
		rocks = {
			enabled = false, -- disable luarocks (still gives error in checkhealth)
			hererocks = false, -- disable hererocks (still gives error in checkhealth)
		},
	},
})
