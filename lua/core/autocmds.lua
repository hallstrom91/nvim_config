-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*", "*.md" },
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- open help window in vertical mode
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

-- auto update plugins at start
local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup("autoupdate"),
	callback = function()
		vim.defer_fn(function()
			if require("lazy.status").has_updates() then
				require("lazy").update({ show = false })
			end
		end, 1000)
	end,
})

-- Auto update installs from mason
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("MasonUpdate")
	end,
})

-- Auto update Treesitter Parser
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("TSUpdate")
	end,
})

-- Close lazy UI with ESC
local user_grp = vim.api.nvim_create_augroup("LazyUserGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lazy",
	desc = "Quit lazy with <esc>",
	callback = function()
		vim.keymap.set("n", "<esc>", function()
			vim.api.nvim_win_close(0, false)
		end, { buffer = true, nowait = true })
	end,
	group = user_grp,
})
